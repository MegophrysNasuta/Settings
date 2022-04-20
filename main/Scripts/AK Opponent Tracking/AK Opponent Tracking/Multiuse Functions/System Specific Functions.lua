function ak.deleteFull()
   if svo then
	 		svo.deleteLineP()
	 else
      deleteFull() --Wsys Has An Overwrite
   end
end

function ak.showPrompt()
	if wsys then
		wsys.showPrompt()
	elseif svo and svo.showprompt then
		echo("\n")
		svo.showPrompt()
	else
		send("")
	end
end

if wsys then
	function wsys.showPrompt()
	  local promptstring = wsys.aff.blackout and wsys.settings.blackoutprompt or wsys.settings.prompt
	  --sub out the # color tags
	  promptstring = string.gsub(promptstring, "#([A-Za-z_:]+)", wsys.promptColorSub )
	  --sub out the @ prompt tags
	  promptstring = string.gsub(promptstring, "@(%w+)", wsys.promptTagSub )
	
	  if wsys.def.lyre then promptstring = promptstring .. "<gold> L" end
		if wsys.uselyre then promptstring = promptstring .. "<green> *[<white>LYRE MODE<green>]*" end 
		
	  if wsys.vmode then promptstring = promptstring ..  "<MediumVioletRed> vivi" end
	  if wsys.heartseedmode then promptstring = promptstring ..  "<firebrick> H<LimeGreen>Seed" end
	  if wsys.bardmode then promptstring = promptstring .. "<firebrick> BARD" end
		cecho("\n"..promptstring)
	end
end
