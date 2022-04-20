if ak.ai() then return end



if IsTargetted(matches[2]) then
  if affstrack.whisperscore < 1 then
   for i=1, #affstrack.whisperlist do
    if affstrack.score[affstrack.whisperlist[i]] > 0 then
      if ak.ProTrackingConfirmed then
        ak.ProTrackingConfirmed(affstrack.whisperlist[i])
        OppGainedAff("whisperingmadness")
        return
      else
        affstrack.score[affstrack.whisperlist[i]] = 100
        OppGainedAff("whisperingmadness")
        return
      end
    end
   end
  end
  OppGainedAff("whisperingmadness")
end

