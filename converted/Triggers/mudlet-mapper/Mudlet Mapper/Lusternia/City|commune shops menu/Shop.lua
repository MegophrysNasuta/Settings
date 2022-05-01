local shop = line:sub(1, 25):trim()
if shop:sub(1,1) == '*' then return end

cecho("  <orange_red>(")
mmp.echonums(shop)
cecho("<orange_red>)")
