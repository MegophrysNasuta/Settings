if not IsTargetted(matches[2]) then return end
if affstrack.score.spiritburn == 100 and affstrack.score.guilt == 100 then
   OppGainedAff("inquisition")
   inquisitiontimer = tempTimer(19, [[OppLostAff("inquisition")]])
end


