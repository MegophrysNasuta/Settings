if mmp.autowalking then
  if matches[4] == "HERE" then
  	mmp.liftFloor(matches[3],matches[2],true)
		mmp.correctLiftFloor = true
  else
		if not mmp.correctLiftFloor then
  		mmp.liftFloor(matches[3],matches[2],false)
		end
  end
	mmp.deleteLineP()
end
