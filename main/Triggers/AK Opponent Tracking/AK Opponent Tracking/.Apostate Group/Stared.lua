if ak.ai() then
  return
end
if nextcurse then
  if nextcurse == "breach" then
  elseif nextcurse == "sicken" then
    if affstrack.score.paralysis < 100 then
      nextcurse = "paralysis"
    elseif affstrack.score.healthleech < 100 then
      nextcurse = "manaleech"
    else
      nextcurse = "slickness"
    end
  elseif nextcurse == "plague" then
    nextcurse = "voyria"
  elseif nextcurse == "clumsy" then
    nextcurse = "clumsiness"
  elseif nextcurse == "dizzy" then
    nextcurse = "dizziness"
  elseif nextcurse == "stupid" then
    nextcurse = "stupidity"
  elseif nextcurse == "vomiting" then
    nextcurse = "nausea"
  elseif nextcurse == "reckless" then
    nextcurse = "recklessness"
  end
  OppGainedAff(nextcurse)
  nextcurse = nil
  return
end
if nextcurse2 then
  if nextcurse2 == "breach" then
  elseif nextcurse2 == "sicken" then
    if affstrack.score.paralysis < 100 then
      nextcurse2 = "paralysis"
    elseif affstrack.score.healthleech < 100 then
      nextcurse2 = "manaleech"
    else
      nextcurse2 = "slickness"
    end
  elseif nextcurse2 == "plague" then
    nextcurse2 = "voyria"
  elseif nextcurse2 == "clumsy" then
    nextcurse2 = "clumsiness"
  elseif nextcurse2 == "dizzy" then
    nextcurse2 = "dizziness"
  elseif nextcurse2 == "stupid" then
    nextcurse2 = "stupidity"
  elseif nextcurse2 == "vomiting" then
    nextcurse2 = "nausea"
  elseif nextcurse2 == "reckless" then
    nextcurse2 = "recklessness"
  end
  OppGainedAff(nextcurse2)
  nextcurse2 = nil
end
