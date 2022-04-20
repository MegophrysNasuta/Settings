wsys.overrides = wsys.overrides or {}

-------------------------------------------------
--              Aff Tag Overrides              --
-------------------------------------------------
wsys.overrides.afftags = wsys.overrides.afftags or {}

--- Aff prompt tag shortnames may be used to override the string displayed in the @affs prompt tag
-- Example: 
--   wsys.overrides.afftags.shortnames.paralysis = "PARALYZED!!"
-- So instead of the default "PAR" you see in your prompt when paralyzed, you'd see "PARALYZED!!"
-- Important: Don't use < or > here. It won't appear correctly because things may be interpretted as colors
wsys.overrides.afftags.shortnames = wsys.overrides.afftags.shortnames or {}

--- Aff prompt tag colors may be used to override the default colors used for a given affliction
-- Example 1:
--   wsys.overrides.afftags.colors.paralysis = "blue"
-- Example 2:
--   wsys.overrides.afftags.colors.prone = "white:red"
--   This would make prone appear as white text on a red background
--
-- You may also provide a table with values for stackable affs
-- Example 3:
--   wsys.overrides.afftags.colors.bleeding = { "maroon", [200] = "red", [500] = "white" },
--   This would show bleeding as maroon from 1-199, red at 200-499, and white at 500+
wsys.overrides.afftags.colors = wsys.overrides.afftags.colors or {}

--- Aff prompt tags may also override the default cure colors
-- Note: Cure colors are only used if an aff specific color is not already configured, default or otherwise
-- Also note: the cure specified here may be a prefix to multiple cure types. 
--   E.g. "mending" will match "mendinglegs", "mendingarms", etc.
--   Core possible cure types, please see wsys.tb.affc
-- The colors provided may either be a simple color, or a table of colors based on stack value, as above.
-- Example 1:
--   wsys.overrides.afftags.cure_colors.kelp = "white"
-- 
-- Example 2:
--   wsys.overrides.afftags.cure_colors.health = { "green", [3] = "blue", [6] = "blue:white" }
--   This would display fractures (cured by "healthlegs", "healtharms", etc) as green from 1-2 stacks, 
--   blue at 3-5, and blue with a white background at 6+
wsys.overrides.afftags.cure_colors = wsys.overrides.afftags.cure_colors or {}

-------------------------------------------------
--            Do Queue Expansions              --
-------------------------------------------------
wsys.overrides.doqueue = wsys.overrides.doqueue or {}

--- Doqueue variable function expansion support
-- Each entry you add to this table will be called when prefixed with $
-- The key should be a string, and the value should be a function that returns a string.
-- The input command will be expanded once when you queue the command, and again if wsys.doupdate() is called.
--
--[[ Examples:
wsys.overrides.doqueue.expand.target = function() return my_target end
wsys.overrides.doqueue.expand.atk = function()
  if has_rebounding or has_shield then 
    return "raze"
  else
    return "jab"
  end
end
-- You may then call: wsys.dofirst("$atk $target")
-- If "Tynil" is my_target, then this would expand to "raze Tynil" if has_rebounding or has_shield is true.
-- Else, it expands to "jab Tynil"
-- Calling wsys.doupdate() when those has_rebounding/shield variables change would cause this to re-evaluate
-- and potentially change which attack is queued.
-- You don't need to use all expansions. wsys.doadd("kick $target") would expand to "kick Tynil" here.
]]
wsys.overrides.doqueue.expand = wsys.overrides.doqueue.expand or {}
