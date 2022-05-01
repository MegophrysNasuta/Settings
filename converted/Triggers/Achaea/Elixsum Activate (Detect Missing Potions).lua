elixsum = {elixirs = {}}
enableTrigger("Elixsum Read (Detect Missing Potions)")

local every_elixir = {
  "an elixir of frost", "an elixir of health", "an elixir of mana",
  "an elixir of immunity", "an elixir of levitation",
  "an elixir of venom", "an elixir of speed", "a caloric salve",
  "an epidermal salve", "a salve of mending", "a salve of restoration"
}

tempTimer(.5, function()
  disableTrigger("Elixsum Read (Detect Missing Potions)")
  for _, elixir in pairs(every_elixir) do
    if not elixsum.elixirs[elixir] then
      cecho("\n<cyan>Missing ".. elixir .."!")
    elseif elixsum.elixirs[elixir] < 2 then
      cecho("\n<cyan>".. elixir .." looks lonely all by itself...")
    end
  end
end)
