--ak.HeadWrench
ak = ak or {}
if affstrack.score.wrenchhead then
   if ak.InitialWrench then
      ak.InitialWrench = false
   else
      local aff = "epilepsy"
      OppGainedAff(aff)
   end
else
   disableTimer("Wrench Torso Timer")
end
