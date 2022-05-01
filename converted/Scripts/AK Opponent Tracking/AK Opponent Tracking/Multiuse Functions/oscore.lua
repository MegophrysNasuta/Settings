--scoreup
-------------------------------------------------
--         Put your Lua functions here.        --
--                                             --
-- Note that you can also use external Scripts --
-------------------------------------------------
function ak.scoreup(whom)
if ak.expertdiagnose and not gmcp.Char.Status.race:match("Dragon") and not ak.pause and not ak.syspause() then
   ak.expertRun()
end
--"Haemophilia, clumsiness, sensitivity, healthleech, darkshade, lethargy."
affstrack.accentatoscore = affstrack.score.impatience + affstrack.score.paranoia + affstrack.score.claustrophobia + affstrack.score.vertigo + affstrack.score.confusion + affstrack.score.dizziness + affstrack.score.stupidity + affstrack.score.addiction + affstrack.score.epilepsy + affstrack.score.anorexia + affstrack.score.generosity + affstrack.score.amnesia
affstrack.mentalscore = affstrack.accentatoscore + affstrack.score.agoraphobia + affstrack.score.recklessness
affstrack.mentalscore = affstrack.mentalscore / 100
affstrack.accentatoscore = affstrack.accentatoscore / 100

affstrack.kelpscore = affstrack.score.healthleech + affstrack.score.asthma + affstrack.score.clumsiness + affstrack.score.hypochondria + affstrack.score.sensitivity + affstrack.score.weariness 
affstrack.kelpscore = affstrack.kelpscore / 100
affstrack.ginsengscore = affstrack.score.addiction + affstrack.score.darkshade + affstrack.score.haemophilia + affstrack.score.lethargy + affstrack.score.nausea + affstrack.score.scytherus
affstrack.ginsengscore = affstrack.ginsengscore / 100

affstrack.goldenscore =  affstrack.score.dizziness + affstrack.score.epilepsy + affstrack.score.impatience + affstrack.score.shyness + affstrack.score.stupidity
affstrack.goldenscore = affstrack.goldenscore / 100

affstrack.pyradiusscore = affstrack.score.clumsiness + affstrack.score.lethargy + affstrack.score.haemophilia + affstrack.score.healthleech + affstrack.score.sensitivity + affstrack.score.darkshade 
affstrack.pyradiusscore = affstrack.pyradiusscore / 100
softscore = affstrack.score.anorexia + affstrack.score.slickness + affstrack.score.asthma
softscore = softscore / 100
truescore = affstrack.score.paralysis + affstrack.score.impatience + affstrack.score.anorexia + affstrack.score.slickness + affstrack.score.asthma
truescore = truescore / 100
affstrack.tramplescore = 0
ak.trample()
affstrack.totalaffs = 0
affstrack.enlightenscore = 0
affstrack.whisperscore = 0
for k,v in pairs(affstrack.score) do
   if v > 1 then
      affstrack.totalaffs = affstrack.totalaffs + v
      if table.contains(affstrack.enlightenlist, k) then
         affstrack.enlightenscore = affstrack.enlightenscore + v
      end
      if table.contains(affstrack.whisperlist, k) then
         affstrack.whisperscore = affstrack.whisperscore + v
      end
   end
end
affstrack.totalaffs = affstrack.totalaffs / 100
affstrack.enlightenscore = affstrack.enlightenscore / 100
affstrack.whisperscore = affstrack.whisperscore / 100
if ak.tzantzajinxed then
	ak.tzantzajinxed = false
elseif target and not ak.pause and not ak.syspause() then 
   ak.serveraliases() 
end
ak.prompt.scoreup()
if ak.nodisplay then ak.noDisplay() else ak.refreshAffs() end
end
  --<3
function ak.trample() 
   affstrack.tramplescore = 0
   affstrack.tramplescore = affstrack.score["leftarm"] + affstrack.score["leftleg"] + affstrack.score["rightleg"] + affstrack.score["rightarm"]
   affstrack.tramplescore = affstrack.tramplescore / 100
end

