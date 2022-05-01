ak.ribscount = ak.ribscount or 0
ak.ribscount = ak.ribscount + 1
if ak.twoh.ribs == 0 then
	disableTimer("AK_RibsTimer")
	ak.ribscount = 0
elseif ak.twoh.ribs == 1 and ak.ribscount == 5 then
	ak.ribscount = 0
	OppGainedAff("prefarar")
elseif ak.twoh.ribs == 2 and ak.ribscount == 4 then
	ak.ribscount = 0
	OppGainedAff("prefarar")
elseif ak.twoh.ribs == 3 and ak.ribscount == 3  then
	ak.ribscount = 0
	OppGainedAff("prefarar")
elseif ak.twoh.ribs == 4 and ak.ribscount == 2 then
	ak.ribscount = 0
	OppGainedAff("prefarar")
elseif ak.twoh.ribs == 5 and ak.ribscount == 1 then
	ak.ribscount = 0
	OppGainedAff("prefarar")
end 
