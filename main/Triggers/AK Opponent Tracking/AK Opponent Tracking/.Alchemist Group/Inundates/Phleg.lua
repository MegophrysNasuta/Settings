local aff = "weariness anorexia slickness lethargy"

if ak.alchemist.humour.phlegmatic < 4 then
	aff = "lethargy"
elseif ak.alchemist.humour.phlegmatic < 6 then
	aff = "lethargy anorexia"
elseif ak.alchemist.humour.phlegmatic < 7 then
	aff = "lethargy anorexia slickness"
end
if matches[2] == target then
	OppGainedAff(aff)
end
ak.alchemist.humour.phlegmatic = 0
