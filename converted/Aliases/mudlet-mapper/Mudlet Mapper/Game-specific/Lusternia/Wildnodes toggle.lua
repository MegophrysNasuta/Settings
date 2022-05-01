if mmp.game ~= "lusternia" then return end
mmp.wildnodes(matches[2]:lower()=="on")
mmp.echo("All astral nodes have been "..(matches[2]:lower()=="on" and "" or "un").."linked.")
