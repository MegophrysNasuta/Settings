if keepChameleonUp then
  local chamList = {'Joshfire', 'Zadkiel', 'Zbaco', 'Layta', 'Yen', 'Bambi',
                    'Andraste', 'Andrayas', 'Tianondria', 'Astarod'}
  chameleonedAsUser = nil
  for _, identity in pairs(chamList) do
    if (not table.contains(Megophrys.playersOnline, identity) and
        math.random() > 0.5) then
      chameleonedAsUser = identity
      cecho('\n<DarkOrange>Chameleon set to '.. identity)
      send('touch chameleon '.. identity)
      break
    end
  end
  
  if not chameleonedAsUser then
    cecho('\n<red>WARNING: No suitable chameleon target found.')
  end
end
