local talismankey = talisman.getkey(matches[2])
if refinedtalisman then
  talisman.add(talismankey, 1, 1, talisman.types.refine)
else
  talisman.add(talismankey, 1, 1, talisman.types.promo)
end
