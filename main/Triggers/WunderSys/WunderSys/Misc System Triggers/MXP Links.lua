local link = matches[2]
if string.ends( link, [[.]] ) then
	link = string.cut( link, string.len( link ) - 1 )
end
selectString( link, 1 )
setUnderline(true)
setLink( [[openUrl( "]] .. link .. [[" )]], "Open URL: " .. link )
deselect()
