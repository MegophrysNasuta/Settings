if ak.ai() then return end
if not IsTargetted(matches[2]) then return end
affs = {}
ocured = ocured or {}
ocured[ocured.conversion["rage"]] = {}
ak.occie.aura.parsereduct("rage")
for i = 1, #affstrack.eaten["rage"] do
   if affstrack.score[affstrack.eaten["rage"][i]] > 0 then
      table.insert(affs, affstrack.eaten["rage"][i])
   end
end 
if #affs > 0 then
   ak.echoForPossibleCures(table.concat(affs, " "))
   for i = 1, #affs do
      ocured[ocured.conversion["rage"]][affs[i]] = affstrack.score[affs[i]]
      affstrack.score[affs[i]] = affstrack.score[affs[i]] - affstrack.score[affs[i]] / #affs
      if affstrack.score[affs[i]] < ak.errorallowance then
          affstrack.score[affs[i]] = 0
      end
   end
end
ak.scoreup(matches[2])
 

