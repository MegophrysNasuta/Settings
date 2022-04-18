#!/usr/bin/env python3
import os
import json
import re
import sys
from xml.etree import ElementTree as ET


class MudletXMLPackageExtractor:
    NUMBERED_JSON_REGEX = re.compile(r'\.?[\d+]*\.json')
    PACKAGE_TAGS = tuple(('%sPackage' % tag for tag in
                         ('Trigger', 'Timer', 'Alias', 'Script', 'Key')))

    def __init__(self, overwrite=False):
        self.overwrite = bool(overwrite)

    def __call__(self, tree, dirpath):
        root = tree.getroot()

        if root.tag != 'MudletPackage':
            raise ValueError("Are you sure '%s' is a Mudlet Package?" % filepath)
        else:
            print("Parsing Mudlet Package (version: %s)" % root.attrib.get('version',
                                                                           'unknown'))

        dirpath = os.path.abspath(dirpath)
        for pkg_tag in self.PACKAGE_TAGS:
            group_tag = pkg_tag.replace('Package', 'Group')
            node_tag = group_tag.replace('Group', '')
            for group in root.find(pkg_tag) or ():
                self.extract_group(group, dirpath, node_tag)

    def extract_group(self, group, dirpath, node_tag):
        group_info = self.get_node_info(group)
        group_name = group_info['name']
        if group_info.get('attribs', {}).get('isActive') == 'no':
            group_name = '.%s' % group_name
        dirpath = os.path.join(dirpath, group_name)
        try:
            os.mkdir(dirpath)
        except FileExistsError:
            pass

        for node in group.findall(node_tag):
            self.write_node(node, dirpath)
        for subgroup in group.findall('%sGroup' % node_tag):
            self.extract_group(subgroup, dirpath, node_tag)

    def get_node_info(self, node):
        self.unknowns = getattr(self, 'unknowns', 1)
        node_info = {'attribs': node.attrib, 'type': node.tag.lower()}
        node_info.update({child.tag: child.text for child in node})

        if node_info.get('name') is None:
            node_info['name'] = 'Unknown %s %i' % (node.tag, self.unknowns)
            self.unknowns += 1

        node_info['name'] = (node_info['name'].replace('/', '-')
                                              .replace('\\', '|'))

        if node.tag == 'Trigger':
            node_info['matches'] = list(zip(
                (tag.text for tag in node.find('regexCodeList')),
                (tag.text for tag in node.find('regexCodePropertyList')),
            ))

        return node_info

    def write_node(self, node, dirpath):
        node_info = self.get_node_info(node)
        filename = '%s.json' % node_info['name']
        filename = self._get_next_available_filename(dirpath, filename)
        is_active = node_info.get('attribs', {}).get('isActive') == 'yes'
        if not is_active:
            filename = '.%s' % filename     # 'hidden' file
        with open(os.path.join(dirpath, filename), 'w') as filestore:
            filestore.write(json.dumps(node_info, indent=4))
        if node_info.get('script'):
            lua_filename = filename.replace('.json', '.lua')
            with open(os.path.join(dirpath, lua_filename), 'w') as luafile:
                print(node_info['script'], file=luafile)

    def _get_next_available_filename(self, dirpath, filename):
        i = 1
        while os.path.exists(os.path.join(dirpath, filename)):
            filename = self.NUMBERED_JSON_REGEX.sub('.%i.json' % i,
                                                    filename)
            i += 1
        return filename


class MudletXMLCompiler:
    def __init__(self, package_name, package_path=None):
        self.package_name = str(package_name)
        self.package = ET.Element('MudletPackage')
        self.package.attrib['version'] = '1.001'
        self.tree = ET.ElementTree(self.package)

        package_tags = list(MudletXMLPackageExtractor.PACKAGE_TAGS)
        package_tags.insert(3, 'ActionPackage')
        for package_tag in package_tags:
            ET.SubElement(self.package, package_tag)
        ET.SubElement(ET.SubElement(self.package, 'HelpPackage'), 'helpURL')

        self.package_path = os.path.abspath(package_path or os.getcwd())

    def add_to_package(self, dirpath, filename):
        with open(os.path.join(dirpath, filename)) as filestore:
            data = json.loads(filestore.read())

        data_type = data.pop('type').title()
        sub_node_info = self._get_sub_nodes_by_type(data_type, data['name'])

        lua_filename = filename.replace('.json', '.lua')
        try:
            with open(os.path.join(dirpath, lua_filename)) as luafile:
                data['script'] = luafile.read()
        except (IOError, OSError):
            pass

        dirpath = (os.path.abspath(dirpath)
                    .replace(self.package_path, '')
                    .lstrip('/'))
        subgroup = self.package.find('%sPackage' % data_type)
        attribs = data.pop('attribs', self._get_attribs_by_type(data_type))
        attribs['isFolder'] = 'yes'
        for key in os.path.normpath(dirpath).split('/'):
            group, is_active, key = None, key.startswith('.'), key.lstrip('.')
            for g in subgroup.findall('%sGroup' % data_type):
                group_name = g.find('name')
                if group_name is not None and group_name.text == key:
                    group = g
                    break
            if group is None:
                attribs['isActive'] = self.attrib_bool(is_active)
                group = ET.SubElement(subgroup, '%sGroup' % data_type, attribs)
                for tag_name, tag_text in sub_node_info.items():
                    tag = ET.SubElement(group, tag_name)
                    if tag_name == 'name':
                        tag.text = key
                    else:
                        tag.text = tag_text
            subgroup = group

        attribs['isFolder'] = 'no'
        matches = data.pop('matches', ())
        sub_node_info.update(data)
        node = ET.SubElement(group, data_type, attribs)
        for tag_name, tag_text in sub_node_info.items():
            tag = ET.SubElement(node, tag_name)
            tag.text = tag_text
        for regexCode, regexCodeProperty in matches:
            tag = ET.SubElement(node.find('regexCodeList'), 'string')
            tag.text = regexCode
            tag = ET.SubElement(node.find('regexCodePropertyList'), 'integer')
            tag.text = regexCodeProperty


    def attrib_bool(self, value):
        return 'yes' if bool(value) else 'no'

    def _get_attribs_by_type(self, type_):
        return {
            'trigger': {
                'isActive': 'yes',
                'isFolder': 'no',
                'isTempTrigger': 'no',
                'isMultiline': 'no',
                'isPerlSlashGOption': 'no',
                'isColorizerTrigger': 'no',
                'isFilterTrigger': 'no',
                'isSoundTrigger': 'no',
                'isColorTrigger': 'no',
                'isColorTriggerFg': 'no',
                'isColorTriggerBg': 'no',
            },
            'timer': {
                'isActive': 'yes',
                'isFolder': 'no',
                'isTempTimer': 'no',
                'isOffsetTimer': 'no',
            }
        }.get(type_.lower(), {'isActive': 'yes', 'isFolder': 'no'})

    def _get_sub_nodes_by_type(self, type_, name):
        return {
            'trigger': {
                'name': name,
                'script': '',
                'triggerType': 0,
                'conditionLineDelta': 0,
                'mStayOpen': 0,
                'mCommand': '',
                'packageName': '',
                'mFgColor': '',
                'mBgColor': '',
                'mSoundFile': '',
                'colorTriggerFgColor': '',
                'colorTriggerBgColor': '',
                'regexCodeList': '',
                'regexCodePropertyList': '',
            },
            'alias': {
                'name': '',
                'script': '',
                'command': '',
                'packageName': '',
                'regex': '',
            },
            'script': {
                'name': '',
                'packageName': '',
                'script': '',
                'eventHandlerList': '',
            },
            'key': {
                'name': '',
                'script': '',
                'command': '',
                'packageName': '',
                'keyCode': '',
                'keyModifier': '',
            },
            'timer': {
                'name': '',
                'script': '',
                'command': '',
                'packageName': '',
                'time': '',
            },
            'variable': {
                'name': '',
                'keyType': '',
                'value': '',
                'valueType': '',
            }
        }.get(type_.lower(), {})

    @property
    def package_file(self):
        return '%s.xml' % self.package_name

    def compile(self):
        for dirpath, _, filenames in os.walk(self.package_path):
            for filename in filenames:
                if filename.endswith('.json'):
                    self.add_to_package(dirpath, filename)
        pkg_path = os.path.join(self.package_path, self.package_file)
        self.tree.write(pkg_path)
        print('%s successfully written.' % pkg_path)


def run_interactive():
    main_menu = """
    Nasuta's Achaea Packaging Tools
    ===============================

    1. Extract a package into files and folders
    2. Compile files and folders into a package
    3. Quit

    Your choice? """
    package_path_question = """
    Enter the path to your package: """
    package_name_question = """
    Enter the name of your package: """
    source_code_question = """
    Enter the path to your source code: """
    target_path_question = """
    Enter the path to store the result: """

    def die(code=1):
        print()
        print('Exiting...', file=sys.stderr)
        sys.exit(int(code))

    menu_opt = 0
    while not (0 < menu_opt < 4):
        try:
            menu_opt = int(input(main_menu))
        except ValueError:
            pass
        except (KeyboardInterrupt, EOFError):
            die()
            break

    if menu_opt == 1:
        try:
            pkg_path = os.path.abspath(input(package_path_question))
            while not os.path.exists(pkg_path):
                print("\tCan't find this package!", file=sys.stderr)
                pkg_path = os.path.abspath(input(package_path_question))

            tgt_path = os.path.abspath(input(target_path_question))
        except (KeyboardInterrupt, EOFError):
            die()
        else:
            if len(os.listdir(tgt_path)):
                print('Remove the target directory first!', file=sys.stderr)
                die()
            extractor = MudletXMLPackageExtractor(overwrite=False)
            data = ET.parse(pkg_path)
            extractor(data, tgt_path)
    elif menu_opt == 2:
        try:
            pkg_path = os.path.abspath(input(source_code_question))
            while not os.path.exists(pkg_path):
                print("\tCan't find this package!", file=sys.stderr)
                pkg_path = os.path.abspath(input(source_code_question))

            pkg_name = input(package_name_question)
        except (KeyboardInterrupt, EOFError):
            die()
        else:
            compiler = MudletXMLCompiler(pkg_name, pkg_path)
            compiler.compile()


if __name__ == "__main__":
    run_interactive()
