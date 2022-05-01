mineowners = {}
counter= 0
for k,v in pairs(minetable) do 

cecho("\n\nMaterial type: " ..k)

for m,n in pairs(v) do 
  for p,o in pairs(n) do

    cecho("\nRoom number: " ..p.. "\n")


    for b,r in pairs(o) do
      echo(b..": "..r..",  ")
		if b == 2 then
				mineowners[counter] = r
				counter = counter+1
		end
    end
  end

end

end


cecho("\n\n--STRONGHOLDS--\n")
for k,v in pairs(strongholdtable) do

cecho("\n Room number: " ..k.. "\n ")
	for m,n in pairs(v) do
		cecho(m.. ": " ..n.. ", ")
	end

end
