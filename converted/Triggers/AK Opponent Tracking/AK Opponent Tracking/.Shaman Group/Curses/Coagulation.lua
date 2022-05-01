if ak.ai() then return end
cecho("\n<dodger_blue>Coagulated!")
ak.shaman.coagulation = false
ak.bleeding = ak.bleeding - 140
if ak.bleeding < 0 then
	ak.bleeding = 0 
end
if invoked~= nil then
   OppGainedAff(invoked)
end


