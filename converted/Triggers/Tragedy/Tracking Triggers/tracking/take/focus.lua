

if isTarget(matches[2]) then
	backtrack2("impatience")
	Tragedy.Cure("focus")
end      
if isTarget(matches[2]) then  
 deleteFull()	     
 cecho("\n<red>---- FOCUS ----  ")
 cecho("\n<red>---- FOCUS ----  ")
 cecho("\n<red>---- FOCUS ----  ")
end

if tarAff("guilt") then

  local randomMind = {"stupidity", "epilepsy", "dizziness", "confusion", "recklessness"}
  getMind = math.random(1, #randomMind)
  mindAdd = randomMind[getMind]
  
  
  if isTarget(matches[2]) then 
    Tragedy.noshowAdd(mindAdd)
  end
  
end
