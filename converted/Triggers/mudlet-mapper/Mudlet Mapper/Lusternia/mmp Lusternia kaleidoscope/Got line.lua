local person, room = matches[2], matches[3]:trim()


selectString(line, 1) replace""

-- get the name
cecho("<green>"..person.."<reset>: ")

-- ids
--mmp.echonums()

-- pad spaces so we have aligned roomname
echo(string.rep(" ", 13 - #getCurrentLine()))

-- and finally, the roomname
echo(room)

mmp.locateAndEchoSide(room, person)


if mmp.tempscent[room] then
	mmp.tempscent[room][#mmp.tempscent[room]+1] = person
else
	mmp.tempscent[room] = {person}
end

-- save in our person tracking db
mmp.pdb[person] = room
mmp.pdb_lastupdate[person] = true
