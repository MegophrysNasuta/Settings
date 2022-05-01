--deleteLine()

selectString(line, 1) replace""

-- get the name
cecho("<green>"..matches[2].."<reset>: ")

-- ids
mmp.echonums(matches[3])

-- pad spaces so we have aligned roomname
echo(string.rep(" ", 25 - #getCurrentLine()))

-- and finally, the roomname
echo(matches[3])


if mmp.tempscent[matches[3]] then
	mmp.tempscent[matches[3]][#mmp.tempscent[matches[3]]+1] = matches[2]
else
	mmp.tempscent[matches[3]] = {matches[2]}
end

-- save in our person tracking db
mmp.pdb[matches[2]] = matches[3]
mmp.pdb_lastupdate[matches[2]] = true
