if ak.ai() then return end
currentenvenom = matches[3]
if not currentvenoms then currentvenoms = {} end
if not currentvenoms[currentenvenom] then currentvenoms[currentenvenom] = {} end
table.insert(currentvenoms[currentenvenom],1,matches[2])
--display(currentvenoms[currentenvenom][1])
if gmcp.Char.Status.class == "Magi" and (inretardation() or inaeon()) then
   ak.scoreup(target)
end

