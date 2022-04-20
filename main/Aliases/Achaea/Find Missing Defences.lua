local expectedDefs = {
  "starburst",
  "blindness",
  "deafness",
  "moontattoo",
  "mosstattoo",
  "megalithtattoo",
  "boartattoo",
  "insomnia",
  "belltattoo",
  "insulation",       -- caloric salve
  "levitating",
  "temperance",       -- frost elixir
  "kola",
  "thirdeye",
  "poisonresist",
  "speed",
  "selfishness",
  "cloak",
  "mindseye",
  "fangbarrier",      -- sileris
  "deathsight",
  "electricresist",   -- sunless hope
  "fireresist",       -- sunless hope
  "coldresist",       -- sunless hope
  "magicresist",      -- sunless hope
}

if gmcp.Char.Status.Class == 'Psion' then
  local psionDefs = {
    "secondskin",
    "psitranscend",
    "psicomprehend",
    "guidedstrike",
  }
  expectedDefs = table.n_union(expectedDefs, psionDefs)
elseif gmcp.Char.Status.Class == 'Magi' then
  local magiDefs = {
    "stoneskin",
    "stonefist",
    "diamondskin",
    "chargeshield",
  }
  expectedDefs = table.n_union(expectedDefs, magiDefs)
end

if gmcp.Char then
  local defTable = {}
  for _, def in pairs(gmcp.Char.Defences.List) do
    defTable[#defTable + 1] = def.name
  end
  local missingDefs = {}
  for _, def in pairs(expectedDefs) do
    if not table.contains(defTable, def) then
      missingDefs[#missingDefs + 1] = def
    end
  end
  if #missingDefs > 0 then
    cecho('\n<cyan>Missing defences:\n')
    display(missingDefs)
  else
    cecho('\n<cyan>No defences down.\n')
  end
else
  cecho('\n<red>GMCP not available.\n')
end
