-------------------------------------------------
-- Custom Diagnose Lines
--
-- We get a gmcp aff List event before every
-- diagnose, before the prompt comes through.
-- Add custom lines here for things that don't give
-- the correct value through gmcp
-------------------------------------------------

wsysf.aff_tracking.diagnose_lines = wsysf.aff_tracking.diagnose_lines or {}

local humour_diagnose = function()
	local aff = "tempered"..matches[2]
	local new_count = tonumber(matches[3])
	
	wsysf.aff_tracking.set_aff_value( aff, new_count )
end

wsysf.aff_tracking.diagnose_lines.temperedcholeric = {
	regex_line = "^your (choleric) humour has been tempered a total of (\\d+) times\.$",
	func = humour_diagnose,
}
wsysf.aff_tracking.diagnose_lines.temperedmelancholic = {
	regex_line = "^your (melancholic) humour has been tempered a total of (\\d+) times\.$",
	func = humour_diagnose,
}
wsysf.aff_tracking.diagnose_lines.temperedphlegmatic = {
	regex_line = "^your (phlegmatic) humour has been tempered a total of (\\d+) times\.$",
	func = humour_diagnose,
}
wsysf.aff_tracking.diagnose_lines.temperedsanguine = {
	regex_line = "^your (sanguine) humour has been tempered a total of (\\d+) times\.$",
	func = humour_diagnose,
}
