if isTarget(matches[2]) then
  if not tarAff("dizziness") then
    Tragedy.TrackerAdd("dizziness")
  elseif tarAff("dizziness") and not tarAff("recklessness") then
    Tragedy.TrackerAdd("recklessness")
  elseif tarAff("dizziness") and tarAff("recklessness") and not tarAff("stupidity") then
    Tragedy.TrackerAdd("stupidity")
  elseif tarAff("dizziness") and tarAff("recklessness") and tarAff("stupidity") and not tarAff("confusion") then
    Tragedy.TrackerAdd("confusion")
  elseif tarAff("dizziness") and tarAff("recklessness") and tarAff("stupidity") and tarAff("confusion") and not tarAff("epilepsy") then
    Tragedy.TrackerAdd("epilepsy")
  end
end


