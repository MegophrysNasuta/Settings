std = {
    globals = {
        -- these are namespaces and shared global targeting variables
        'ak',                               -- Austere's AK Opponent Tracking
        'affstrack',                        -- main global used by AK
        'cdb',                              -- Romaen's CDB (name colors database)
        'demonnic',                         -- anything demonnic makes
        'DirPad',                           -- My directional pad's namespace
        'lb',                               -- Romaen's limb counter
        'Megophrys',                        -- my namespace
        'mmp',                              -- Mudlet Mapper
        'opsec',                            -- my opsec package
        'target',                           -- common global target variable
        'target2',                          -- occassional 2nd target (multi-target attacks)
        'target3',                          -- occassional 3rd target (multi-target attacks)
        'wsys',                             -- WunderSys Achaea Server-Side Curing namespace
    },
    read_globals = {
        -- these seem to be std lua idk why they have to be here
        'error',
        'ipairs',
        'math',
        'pairs',
        'tonumber',
        'tostring',
        'type',
        -- these are Mudlet functions
        'bg',                               -- https://wiki.mudlet.org/w/Manual:UI_Functions#bg
        'cecho',                            -- https://wiki.mudlet.org/w/Manual:UI_Functions#cecho
        'cechoLink',                        -- https://wiki.mudlet.org/w/Manual:UI_Functions#cechoLink
        'cechoPopup',                       -- https://wiki.mudlet.org/w/Manual:UI_Functions#cechoPopup
        'clearWindow',                      -- https://wiki.mudlet.org/w/Manual:UI_Functions#clearWindow
        'deleteLine',                       -- https://wiki.mudlet.org/w/Manual:UI_Functions#deleteLine
        'deselect',                         -- https://wiki.mudlet.org/w/Manual:UI_Functions#deselect
        'disableTrigger',                   -- https://wiki.mudlet.org/w/Manual:Mudlet_Object_Functions#disableTrigger
        'display',                          -- https://wiki.mudlet.org/w/Manual:Basic_Essentials#display
        'echo',                             -- https://wiki.mudlet.org/w/Manual:Basic_Essentials#echo
        'enableTrigger',                    -- https://wiki.mudlet.org/w/Manual:Mudlet_Object_Functions#enableTrigger
        'expandAlias',                      -- https://wiki.mudlet.org/w/Manual:Miscellaneous_Functions#expandAlias
        'fg',                               -- https://wiki.mudlet.org/w/Manual:UI_Functions#fg
        'getAreaRooms',                      -- https://wiki.mudlet.org/w/Manual:Mapper_Functions#getAreaRooms
        'getCurrentLine',                     -- https://wiki.mudlet.org/w/Manual:UI_Functions#getCurrentLine
        'getLineCount',                     -- https://wiki.mudlet.org/w/Manual:UI_Functions#getLineCount
        'getRoomArea',                      -- https://wiki.mudlet.org/w/Manual:Mapper_Functions#getRoomArea
        'getRoomName',                      -- https://wiki.mudlet.org/w/Manual:Mapper_Functions#getRoomName
        'Geyser',                           -- Mudlet's GUI Components Library
        'gmcp',                             -- Mudlet's GMCP global
        'gotoRoom',                         -- https://wiki.mudlet.org/w/Manual:Mapper_Functions#gotoRoom
        'hideWindow',                       -- https://wiki.mudlet.org/w/Manual:UI_Functions#hideWindow
        'highlightRoom',                    -- https://wiki.mudlet.org/w/Manual:Mapper_Functions#highlightRoom
        'killTimer',                        -- https://wiki.mudlet.org/w/Manual:Timer_Engine
        'killTrigger',                      -- https://wiki.mudlet.org/w/Manual:Mudlet_Object_Functions#killTrigger
        'matches',                          -- https://wiki.mudlet.org/w/Manual:Lua_Functions
        'moveCursor',                       -- https://wiki.mudlet.org/w/Manual:UI_Functions#moveCursor
        'moveCursorDown',                   -- https://wiki.mudlet.org/w/Manual:UI_Functions#moveCursorDown
        'moveCursorEnd',                    -- https://wiki.mudlet.org/w/Manual:UI_Functions#moveCursorEnd
        'moveCursorUp',                     -- https://wiki.mudlet.org/w/Manual:UI_Functions#moveCursorUp
        'multimatches',                     -- https://wiki.mudlet.org/w/Manual:Lua_Functions
        'openUserWindow',                   -- https://wiki.mudlet.org/w/Manual:UI_Functions#openUserWindow 
        'raiseEvent',                       -- https://wiki.mudlet.org/w/Manual:Event_Engine
        'registerAnonymousEventHandler',    -- https://wiki.mudlet.org/w/Manual:Miscellaneous_Functions#registerAnonymousEventHandler
        'resetFormat',                      -- https://wiki.mudlet.org/w/Manual:UI_Functions#resetFormat
        'searchRoom',                       -- https://wiki.mudlet.org/w/Manual:Mapper_Functions#unHighlightRoom
        'selectCaptureGroup',               -- https://wiki.mudlet.org/w/Manual:UI_Functions#selectCaptureGroup
        'selectCurrentLine',                -- https://wiki.mudlet.org/w/Manual:UI_Functions#selectCurrentLine
        'selectString',                     -- https://wiki.mudlet.org/w/Manual:UI_Functions#selectString
        'send',                             -- https://wiki.mudlet.org/w/Manual:Lua_Functions#send
        'sendAll',                          -- https://wiki.mudlet.org/w/Manual:Lua_Functions#sendAll
        'sendGMCP',                         -- https://wiki.mudlet.org/w/Manual:Networking_Functions#sendGMCP
        'setBold',                          -- https://wiki.mudlet.org/w/Manual:UI_Functions#setBold
        'setBorderBottom',                  -- https://wiki.mudlet.org/w/Manual:UI_Functions#setBorderBottom
        'setBorderColor',                   -- https://wiki.mudlet.org/w/Manual:UI_Functions#setBorderColor
        'setBorderLeft',                    -- https://wiki.mudlet.org/w/Manual:UI_Functions#setBorderLeft
        'setBorderRight',                   -- https://wiki.mudlet.org/w/Manual:UI_Functions#setBorderRight
        'setBorderTop',                     -- https://wiki.mudlet.org/w/Manual:UI_Functions#setBorderTop
        'setFontSize',                      -- https://wiki.mudlet.org/w/Manual:UI_Functions#setFontSize
        'setItalics',                       -- https://wiki.mudlet.org/w/Manual:UI_Functions#setItalics
        'setUnderline',                     -- https://wiki.mudlet.org/w/Manual:UI_Functions#setUnderline
        'setWindowWrap',                    -- https://wiki.mudlet.org/w/Manual:UI_Functions#setWindowWrap
        'spairs',                           -- https://wiki.mudlet.org/w/Manual:Table_Functions#spairs
        'speedWalkDir',                     -- https://wiki.mudlet.org/w/Manual:Technical_Manual#getPath
        'string',                           -- https://wiki.mudlet.org/w/Manual:String_Functions
        'table',                            -- https://wiki.mudlet.org/w/Manual:Table_Functions
        'tempTrigger',                      -- https://wiki.mudlet.org/w/Manual:Mudlet_Object_Functions#tempTrigger
        'tempLineTrigger',                  -- https://wiki.mudlet.org/w/Manual:Mudlet_Object_Functions#tempLineTrigger
        'tempPromptTrigger',                -- https://wiki.mudlet.org/w/Manual:Mudlet_Object_Functions#tempPromptTrigger
        'tempTimer',                        -- https://wiki.mudlet.org/w/Manual:Timer_Engine
        'unHighlightRoom',                  -- https://wiki.mudlet.org/w/Manual:Mapper_Functions#unHighlightRoom
        'yajl',                             -- library for reading JSON; https://wiki.mudlet.org/w/Manual:Miscellaneous_Functions#yajl.to_string
    }
}
