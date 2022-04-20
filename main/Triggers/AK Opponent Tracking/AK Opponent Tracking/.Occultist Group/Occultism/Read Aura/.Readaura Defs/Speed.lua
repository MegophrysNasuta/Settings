ak.deleteFull()
ak.defs.speed = true
      if not SpeedTimer then
         SpeedTimer = tempTimer(4,[[
                ak.defs.speed = true
                SpeedTimer = false 
                ak.scoreup(target) 
                ]])
      end
