if ak.ai() then return end
cecho("\n<medium_violet_red>Bloodlet!")
ak.shaman.bloodlet = false
if affstrack.score.haemophilia > 0 then
	ak.bleeding = ak.bleeding + ak.bloodletbleed()
	echo(ak.bleeding)
end
OppGainedAff("haemophilia")
ak.dontremovehaemo = true

