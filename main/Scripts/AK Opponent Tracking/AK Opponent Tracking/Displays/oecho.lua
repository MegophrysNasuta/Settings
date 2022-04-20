-------------------------------------------------
--         Put your Lua functions here.        --
--                                             --
-- Note that you can also use external Scripts --
-------------------------------------------------

function ak.echogain(string)
   if gmcp.Char.Name.name == "Klendathu" and not ak.disableAllEchos then  
      cecho("  <cyan>GAINED AFF:<white> "..string.."<reset>") 
   elseif not ak.disableAllEchos then 
      EchoForAddedAff(string)
   end
end

function ak.echolost(string)
   if gmcp.Char.Name.name == "Klendathu" and not ak.disableAllEchos then 
      cecho("  <cyan>GAINED AFF:<white> "..string.."<reset>")
   elseif not ak.disableAllEchos then
      EchoForLostAff(string) 
   end
end

function ak.echoForPossibleCures(string)
   if gmcp.Char.Name.name == "Klendathu" and not ak.disableAllEchos then 
      cecho("  <cyan>AFF PROCESSED:<white> "..string.."<reset>")
   elseif not ak.disableAllEchos then
      EchoForPossibleCures(string) 
   end
end
