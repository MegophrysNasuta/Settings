if ak.ai() then return end
local donotrun = {
	"azurite mote",
  "gypsum crystal",
	"echinacea root", 
	"bisemutum chip",
	"kola nut",
	"black cohosh root",
	"skullcap flower",
	"dolomite grain",
	"irid moss",
	"potash crystal",
	"quartz grain",
	"ball of myrrh gum",
	"antimony flake",
	"ginger root",
}
if table.contains(donotrun, matches[3]) then
	setTriggerStayOpen("Opponent Ate", 0)
	return
elseif not IsTargetted(matches[2]) then
	setTriggerStayOpen("Opponent Ate", 0)
	return
else
	ak.currenteat = matches[3]
end  
