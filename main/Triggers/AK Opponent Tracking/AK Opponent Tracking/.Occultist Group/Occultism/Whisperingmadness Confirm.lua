if ak.ai() then
  return
end
if ak.ProTrackingConfirmed then
  ak.ProTrackingConfirmed("whisperingmadness")
else
  affstrack.score.whisperingmadness = 100
  ak.scoreup(matches[2])
end
