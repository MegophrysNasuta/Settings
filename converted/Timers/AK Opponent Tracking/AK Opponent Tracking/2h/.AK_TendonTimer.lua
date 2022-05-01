ak.tendonscount = ak.tendonscount or 0
ak.tendonscount = ak.tendonscount + 1
if ak.twoh.tendons == 0 then
	disableTimer("AK_TendonTimer")
	ak.tendonscount = 0
elseif ak.twoh.tendons == 1 and ak.tendonscount == 5 then
	ak.tendonscount = 0
	OppGainedAff("clumsiness")
elseif ak.twoh.tendons == 2 and ak.tendonscount == 4 then
	ak.tendonscount = 0
	OppGainedAff("clumsiness")
elseif ak.twoh.tendons == 3 and ak.tendonscount == 3  then
	ak.tendonscount = 0
	OppGainedAff("clumsiness")
elseif ak.twoh.tendons == 4 and ak.tendonscount == 2 then
	ak.tendonscount = 0
	OppGainedAff("clumsiness")
elseif ak.twoh.tendons == 5 and ak.tendonscount == 1 then
	ak.tendonscount = 0
	OppGainedAff("clumsiness")
end 
