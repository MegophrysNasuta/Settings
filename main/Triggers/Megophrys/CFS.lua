Megophrys = (Megophrys or {})
if matches[1] == 'Credits currently available for purchase:' then
  Megophrys._totalCreditsForSale = 0
  Megophrys._totalCreditPrice = 0
else
  local totalCreditsForSale = Megophrys._totalCreditsForSale
  local totalCreditPrice = Megophrys._totalCreditPrice
  totalCreditsForSale = totalCreditsForSale + tonumber(matches[2])
  totalCreditPrice = totalCreditPrice + (tonumber(matches[2]) * tonumber(matches[3]))
  cecho('\t<cyan>'.. tostring(totalCreditsForSale) ..' credits for '..
        tostring(totalCreditPrice) ..' gold.')
  Megophrys._totalCreditsForSale = totalCreditsForSale
  Megophrys._totalCreditPrice = totalCreditPrice
end
