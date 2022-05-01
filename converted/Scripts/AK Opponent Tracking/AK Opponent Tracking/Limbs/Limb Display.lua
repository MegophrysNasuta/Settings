--limbshow
function ak.limbshow()
   cecho("aff_display","\n<blue>****************\n")
   cecho("aff_display","\nLimbs:                \n")
   ak.limbs = ak.limbs or {}
   ak.limbs.limbcount = ak.limbs.limbcount or {}
   if ak.limbs.limbcount[target] ~= nil then
      cecho("aff_display","\n\nH+T  :<yellow>"..ak.limbs.limbcount[target].head.." "..ak.limbs.limbcount[target].torso.."      \n")
      cecho("aff_display","\n\nArms: <yellow>"..ak.limbs.limbcount[target].leftarm.." "..ak.limbs.limbcount[target].rightarm.."      \n")
      cecho("aff_display","\n\nLegs: <yellow>"..ak.limbs.limbcount[target].leftleg.." "..ak.limbs.limbcount[target].rightleg.."      ")
   end
end
