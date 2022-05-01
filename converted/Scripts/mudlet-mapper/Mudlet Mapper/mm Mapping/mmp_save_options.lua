function mmp_save_options()
	local saveTable = {
		locked_areas = mmp.locked,
		options = mmp.settings:getAllOptions()
	}

	if string.char(getMudletHomeDir():byte()) == "/" then _sep = "/" else  _sep = "\\" end
	local saveFile = getMudletHomeDir() ..  _sep .. "mapper.options.lua"

	table.save(saveFile, saveTable)
end
