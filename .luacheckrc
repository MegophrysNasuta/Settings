std = {
    globals = {
        -- these are std lua idk why they have to be here
        'tonumber',
        'tostring',
        -- these are namespaces
        'ak',                   -- Austere's AK Opponent Tracking
        'cdb',                  -- Romaen's CDB (name colors database)
        'demonnic',             -- anything demonnic makes
        'lb',                   -- Romaen's limb counter
        'Megophrys',            -- my namespace
        'mmp',                  -- Mudlet Mapper
        'opsec',                -- my opsec package
        'target',               -- common global target variable
        'wsys',                 -- WunderSys Achaea Server-Side Curing namespace
    },
    read_globals = {
        -- these are Mudlet functions
        'bg',                   -- https://wiki.mudlet.org/w/Manual:UI_Functions#bg
        'cecho',                -- https://wiki.mudlet.org/w/Manual:UI_Functions#cecho
        'deleteLine',           -- https://wiki.mudlet.org/w/Manual:UI_Functions#deleteLine
        'deselect',             -- https://wiki.mudlet.org/w/Manual:UI_Functions#deselect
        'disableTrigger',       -- https://wiki.mudlet.org/w/Manual:Mudlet_Object_Functions#disableTrigger
        'display',              -- https://wiki.mudlet.org/w/Manual:Basic_Essentials#display
        'echo',                 -- https://wiki.mudlet.org/w/Manual:Basic_Essentials#echo
        'enableTrigger',        -- https://wiki.mudlet.org/w/Manual:Mudlet_Object_Functions#enableTrigger
        'fg',                   -- https://wiki.mudlet.org/w/Manual:UI_Functions#fg
        'gmcp',                 -- Mudlet's GMCP global
        'killTimer',            -- https://wiki.mudlet.org/w/Manual:Timer_Engine
        'matches',              -- https://wiki.mudlet.org/w/Manual:Lua_Functions
        'moveCursor',           -- https://wiki.mudlet.org/w/Manual:UI_Functions#moveCursor
        'moveCursorDown',       -- https://wiki.mudlet.org/w/Manual:UI_Functions#moveCursorDown
        'moveCursorEnd',        -- https://wiki.mudlet.org/w/Manual:UI_Functions#moveCursorEnd
        'moveCursorUp',         -- https://wiki.mudlet.org/w/Manual:UI_Functions#moveCursorUp
        'multimatches',         -- https://wiki.mudlet.org/w/Manual:Lua_Functions
        'raiseEvent',           -- https://wiki.mudlet.org/w/Manual:Event_Engine
        'resetFormat',          -- https://wiki.mudlet.org/w/Manual:UI_Functions#resetFormat
        'selectCaptureGroup',   -- https://wiki.mudlet.org/w/Manual:UI_Functions#selectCaptureGroup
        'selectCurrentLine',    -- https://wiki.mudlet.org/w/Manual:UI_Functions#selectCurrentLine
        'selectString',         -- https://wiki.mudlet.org/w/Manual:UI_Functions#selectString
        'send',                 -- https://wiki.mudlet.org/w/Manual:Lua_Functions#send
        'setBold',              -- https://wiki.mudlet.org/w/Manual:UI_Functions#setBold
        'setItalics',           -- https://wiki.mudlet.org/w/Manual:UI_Functions#setItalics
        'setUnderline',         -- https://wiki.mudlet.org/w/Manual:UI_Functions#setUnderline
        'spairs',               -- https://wiki.mudlet.org/w/Manual:Table_Functions#spairs
        'string',               -- https://wiki.mudlet.org/w/Manual:String_Functions
        'table',                -- https://wiki.mudlet.org/w/Manual:Table_Functions
        'tempLineTrigger',      -- https://wiki.mudlet.org/w/Manual:Mudlet_Object_Functions#tempLineTrigger
        'tempPromptTrigger',    -- https://wiki.mudlet.org/w/Manual:Mudlet_Object_Functions#tempPromptTrigger
        'tempTimer',            -- https://wiki.mudlet.org/w/Manual:Timer_Engine
    }
}
