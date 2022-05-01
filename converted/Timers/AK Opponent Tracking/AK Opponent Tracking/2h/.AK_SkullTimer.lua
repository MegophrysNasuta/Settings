ak.skullcount = ak.skullcount or 0
ak.skullcount = ak.skullcount + 1
if ak.twoh.skull == 0 then
	disableTimer("AK_SkullTimer")
	ak.skullcount = 0
elseif ak.twoh.skull == 1 and ak.skullcount == 5 then
	ak.skullcount = 0
	OppGainedAff("nausea")
elseif ak.twoh.skull == 2 and ak.skullcount == 4 then
	ak.skullcount = 0
	OppGainedAff("nausea")
elseif ak.twoh.skull == 3 and ak.skullcount == 3  then
	ak.skullcount = 0
	OppGainedAff("nausea")
elseif ak.twoh.skull == 4 and ak.skullcount == 2 then
	ak.skullcount = 0
	OppGainedAff("nausea")
elseif ak.twoh.skull == 5 and ak.skullcount == 1 then
	ak.skullcount = 0
	OppGainedAff("nausea")
end 

