if matches[1] == 'Credits currently available for purchase:' then
  totalCreditsForSale = 0
  totalCreditPrice = 0
else
  totalCreditsForSale = totalCreditsForSale + tonumber(matches[2])
  totalCreditPrice = totalCreditPrice + (tonumber(matches[2]) * tonumber(matches[3]))
  cecho('\t<cyan>'.. tostring(totalCreditsForSale) ..' credits for '..
        tostring(totalCreditPrice) ..' gold.')
end
