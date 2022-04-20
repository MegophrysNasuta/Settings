--backtrack define
-------------------------------------------------
--         Put your Lua functions here.        --
--                                             --
-- Note that you can also use external Scripts --
-------------------------------------------------
function ak.AddedAffReset(affliction)
   if ocured then
      for k,v in pairs(ocured) do
         --display(ocured[k]) 
         if table.contains(ocured[k], affliction) then
            ocured[k] = nil
         end   
      end
   end
end

function ak.ResetConfirmAff(affliction)
   if ocured then
      for k,v in pairs(ocured) do
				 if type(v) == "table" and v[affliction] then
            v[affliction] = nil  
				 end 
      end
   end
end

ocured = ocured or {
   parseout = {},
   conversion = {
       ["aurum flake"]      = "kelp",
       ["piece of kelp"]    = "kelp",
       ["lobelia seed"]     = "lobelia",
       ["argentum flake"]   = "lobelia",
       ["prickly ash bark"] = "ash",
       ["stannum flake"]    = "ash",
       ["bellwort flower"]  = "bellwort",
       ["cuprum flake"]     = "bellwort",
       ["goldenseal root"]  = "goldenseal",
       ["plumbum flake"]    = "goldenseal",
       ["bloodroot leaf"]   = "bloodroot",
       ["magnesium chip"]   = "bloodroot",
       ["ginseng root"]     = "ginseng",
       ["ferrum flake"]     = "ginseng",
       ["rage"]             = "rage",
       ["hawthorn berry"]   = "hawthorn",
       ["calamine crystal"] = "hawthorn",
       ["bayberry bark"]    = "bayberry",
       ["arsenic pellet"]   = "bayberry"
   },
   curemethods = {
   "treed",
   "focused",
   "restored",
   "smoked",
   "cureall",
   "applied",
   } 
}

function ak.resetbacktrack()
ocured = {
   conversion = {
       ["aurum flake"]      = "kelp",
       ["piece of kelp"]    = "kelp",
       ["lobelia seed"]     = "lobelia",
       ["argentum flake"]   = "lobelia",
       ["prickly ash bark"] = "ash",
       ["stannum flake"]    = "ash",
       ["bellwort flower"]  = "bellwort",
       ["cuprum flake"]     = "bellwort",
       ["goldenseal root"]  = "goldenseal",
       ["plumbum flake"]    = "goldenseal",
       ["bloodroot leaf"]   = "bloodroot",
       ["magnesium chip"]   = "bloodroot",
       ["ginseng root"]     = "ginseng",
       ["ferrum flake"]     = "ginseng",
       ["rage"]             = "rage",
       ["hawthorn berry"]    = "hawthorn",
       ["calamine crystal"] = "hawthorn",
       ["bayberry bark"]    = "bayberry",
       ["arsenic pellet"]   = "bayberry"
   },
   curemethods = {
   "treed",
   "focused",
   "restored",
   "smoked",
   "cureall",
   "applied",
   } 
}
end


