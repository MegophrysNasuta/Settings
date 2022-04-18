#!/usr/bin/env python3
import os
import json
import re
import shutil
import sys
from xml.etree import ElementTree as ET


class PackageExtractor:
    NUMBERED_JSON_REGEX = re.compile(r'\.?[\d+]*\.json')

    def __init__(self, overwrite=False):
        self.overwrite = bool(overwrite)

    def _create_dirpath(self, dirpath):
        try:
            os.makedirs(dirpath, exist_ok=False)
        except FileExistsError:
            if not self.overwrite:
                raise
            shutil.rmtree(dirpath)
            os.makedirs(dirpath, exist_ok=True)

    def _get_next_available_filename(self, dirpath, filename):
        i = 1
        while os.path.exists(os.path.join(dirpath, filename)):
            filename = self.NUMBERED_JSON_REGEX.sub('.%i.json' % i,
                                                    filename)
            i += 1
        return filename


class MudletXMLPackageExtractor(PackageExtractor):
    PACKAGE_TAGS = tuple(('%sPackage' % tag for tag in
                         ('Alias', 'Key', 'Script', 'Timer', 'Trigger')))

    def __call__(self, tree, dirpath):
        root = tree.getroot()

        if root.tag != 'MudletPackage':
            raise ValueError("Are you sure '%s' is a Mudlet Package?" % filepath)
        else:
            print("Parsing Mudlet Package (version: %s)" % root.attrib.get('version',
                                                                           'unknown'))

        self.paths_created = set()
        for pkg_tag in self.PACKAGE_TAGS:
            for section in root.find(pkg_tag) or ():
                self.extract_section(section, dirpath)

    def extract_section(self, root, dirpath):
        if dirpath not in self.paths_created:
            self._create_dirpath(dirpath)
            self.paths_created.add(dirpath)

        group_tag = root.tag.replace('Package', 'Group')
        node_tag = group_tag.replace('Group', '')

        if 'Group' in group_tag:
            for node in root.findall(node_tag):
                self.write_node(node, dirpath)
            for group_node in root.findall(group_tag):
                node_info = self.get_node_info(group_node)
                grouppath = os.path.join(dirpath, node_info['name'])
                self.extract_section(group_node, grouppath)
        else:
            self.write_node(root, dirpath)

    def get_matches(self, root):
        return zip((tag.text for tag in root.find('regexCodeList')),
                   (tag.text for tag in root.find('regexCodePropertyList')))

    def get_node_info(self, node):
        self.unknowns = getattr(self, 'unknowns', 1)
        node_info = {'enabled': node.attrib.get('isActive') == 'yes',
                     'type': node.tag.lower()}

        for child in ('name', 'script', 'command', 'regex', 'keyCode',
                      'keyModifier', 'time'):
            child_node = node.find(child)
            if child_node is not None:
                node_info[child] = child_node.text

        if node_info.get('name') is None:
            node_info['name'] = 'Unknown %s %i' % (node.tag, self.unknowns)
            self.unknowns += 1

        node_info['name'] = (node_info['name'].replace('/', 'Slash')
                                              .replace('\\', 'Backslash'))

        if node.tag == 'Trigger':
            node_info['matches'] = list(self.get_matches(node))
            node_info['multiline'] = node.attrib.get('isMultiline') == 'yes'

        return node_info

    def write_node(self, node, dirpath):
        node_info = self.get_node_info(node)
        filename = '%s.json' % node_info['name']
        filename = self._get_next_available_filename(dirpath, filename)
        with open(os.path.join(dirpath, filename), 'w') as filestore:
            filestore.write(json.dumps(node_info, indent=4))
        if node_info.get('script'):
            lua_filename = filename.replace('.json', '.lua')
            with open(os.path.join(dirpath, lua_filename), 'w') as luafile:
                print(node_info['script'], file=luafile)


class MudletXMLCompiler:
    def __init__(self, package_name, package_path=None):
        self.package_name = str(package_name)
        self.package = ET.Element('MudletPackage')
        self.package.attrib['version'] = '1.001'
        self.tree = ET.ElementTree(self.package)
        self.package_path = os.path.normpath(
            os.path.abspath(package_path or os.getcwd())).split('/')

    def _add_to_package(self, dirpath, filename):
        with open(os.path.join(dirpath, filename)) as filestore:
            data = json.loads(filestore.read())

        data_type = data.pop('type').title()
        sub_node_info = self._get_sub_nodes_by_type(data_type, data['name'])

        lua_filename = filename.replace('.json', '.lua')
        try:
            with open(os.path.join(dirpath, lua_filename)) as luafile:
                data['script'] = luafile.read()
        except (IOError, OSError):
            print('WARNING: No script for %s found.' % data['name'])

        subpackage = ET.SubElement(self.package, '%sPackage' % data_type)
        attribs = self._get_attribs_by_type(data_type)
        attribs['isFolder'] = 'yes'
        group = ET.SubElement(subpackage, '%sGroup' % data_type, attribs)
        for tag_name, tag_text in sub_node_info.items():
            tag = ET.SubElement(group, tag_name)
            tag.text = tag_text

        for key in os.path.normpath(dirpath).split('/'):
            if key and key not in self.package_path:
                elem = self.package.find(key)
                if elem is None:
                    attribs['isActive'] = self.attrib_bool(key.startswith('.'))
                    group = ET.SubElement(group, '%sGroup' % data_type, attribs)
                    for tag_name, tag_text in sub_node_info.items():
                        tag = ET.SubElement(group, tag_name)
                        tag.text = tag_text

        attribs['isActive'] = self.attrib_bool(data.pop('enabled'))
        if 'isMultiline' in attribs:
            attribs['isMultiline'] = self.attrib_bool(data.pop('multiline'))
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
        pkg_path = '/' + os.path.join(*self.package_path)
        for dirpath, _, filenames in os.walk(pkg_path):
            for filename in filenames:
                if filename.endswith('.json'):
                    self._add_to_package(dirpath, filename)
        self.tree.write(os.path.join(pkg_path, self.package_file))


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
    confirm_overwrite = """
    Overwrite the target directory? (Y/n) """

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
            overwrite = False
            if os.path.exists(tgt_path):
                overwrite = input(confirm_overwrite).lower() == 'y'
            extractor = MudletXMLPackageExtractor(overwrite=overwrite)
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
