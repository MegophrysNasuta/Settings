--limbs db

function ak.limbs.findMyStab(weapon,whomaxhealth)
   if not ak.limbs.myweapons[weapon] then 
      cecho("error.1")
      return 
   end
   local currentmax = 0
   local damage = 0
   for k,v in pairs(ak.limbs.myweapons[weapon]) do
      if currentmax == 0 then 
         currentmax = k
      else
         if ak.limbs.isCloser(whomaxhealth, k, currentmax, weapon) then
            currentmax = k
         end
      end
   end
   ak.limbs.test.currentmax = currentmax
   damage = ak.limbs.myweapons[weapon][currentmax]
   return damage
end

function ak.limbs.isCloser(whomaxhealth, k, currentmax, weapon)
   ak.limbs.test.proximityK = whomaxhealth - k
   ak.limbs.test.proximityCurrent = whomaxhealth - currentmax
   if ak.limbs.test.proximityCurrent < 0 then
      ak.limbs.test.proximityCurrent = ak.limbs.test.proximityCurrent * -1
   end
   if ak.limbs.test.proximityK < 0 then
      ak.limbs.test.proximityK = ak.limbs.test.proximityK * -1
   end
   ak.limbs.test.k = k
   ak.limbs.test.currentmax = currentmax
   if ak.limbs.test.proximityK < ak.limbs.test.proximityCurrent then
      return true
   else
      return false
   end
end

