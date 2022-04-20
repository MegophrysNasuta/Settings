--deleteFull()
local deletealla = {"boomer","mineralmainttwo","mineralmaint","oattack","oattackrl","oattackll","oattackra","oattackla","oattackt","oattackh","oattacklr","oattackll",
      "oattackar","oattackal","oattackch","oattackct","oattacktwo","oattackrltwo","oattacklltwo","oattackratwo","oattacklatwo",
      "oattackttwo","oattackhtwo","oattacklatwo","oattacklltwo","oattackartwo","oattackaltwo","oattackchtwo","oattackcttwo","oattackr"
}
if table.contains(deletealla,multimatches[2][2]) then
   ak.deleteFull()
	 ak.aliases.lastsend[multimatches[2][2]] = nil
   ak.aliases[multimatches[2][2]] = nil
end
