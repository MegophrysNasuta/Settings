if IsTargetted(matches[2]) and targetlyred == 0 then
	 if ak.ai() then return end
   targetlyred = 1
   ak.scoreup(matches[2])
end

