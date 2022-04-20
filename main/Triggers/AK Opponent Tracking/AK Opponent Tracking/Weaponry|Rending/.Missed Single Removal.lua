if ak.ai() then return end
boardaffs = boardaffs or {}
weaponattack = weaponattack or {}
if #boardaffs > 0 then
   table.remove(boardaffs, #boardaffs)
elseif #weaponattack > 0 then
	 if weaponattack[#weaponattack] == "the thorny vines covering your arms" and affstrack.crushedherb then
	 	  table.remove(weaponattack, #weaponattack)	 
	 end
   table.remove(weaponattack, #weaponattack)
end

