local settings_allow_false = {
 elmtwopipe = true,
 valeriantwopipe = true,
 skullcaptwopipe = true,
 promptline2 = true,
}

--change setting
function wsys.setSettings(setting, value)
  if settings_allow_false[setting] then
    if value == "false" then
      wsys.settings[setting] = wsys.stringToBoolean(value)
      wsys.report(setting .. " set to " .. tostring(wsys.stringToBoolean(value)))
    else
      wsys.settings[setting] = value
      wsys.report(setting .. " set to " .. value)
    end
  elseif type(wsys.settings[setting]) == "boolean" then
    wsys.settings[setting] = wsys.stringToBoolean(value)
    wsys.report(setting .. " set to " .. tostring(wsys.stringToBoolean(value)))
  elseif type(wsys.settings[setting]) == "number" then
    wsys.settings[setting] = tonumber(value)
    wsys.report(setting .. " set to " .. tostring(value))
  elseif type(wsys.settings[setting]) == "string" then
    wsys.settings[setting] = value
    wsys.report(setting .. " set to " .. tostring(value))
  elseif setting == "precache" or setting == "focusshift" or setting == "profile" then
  elseif type(wsys.settings[setting]) == "nil" then
    wsys.report(setting .. " is <red>not <white>a valid setting.")
  end
  
  wsys.saveSettings()
end

function wsys.stringToBoolean(s)
  local st = string.lower(s)
  if st == "true" or st == "on" or st == "1" or st == "yes" or st == "yep" or st == "y" then
    return true
  else
    return false
  end
end

function wsys.return_defaultsettings( no_save )
  wsys.settings = 
    {
  elmpipe = "123456",
  skullcappipe = "123456",
  valerianpipe = "123456",
  elmtwopipe = false,
  skullcaptwopipe = false,
  valeriantwopipe = false,
  haverage = false,
  gagclot = true,
  gagcuring = false,
  class = "jobless",
  gagaffshift = true,
  useinsomnia = false,
  affprio = {
    basic = {
    },
  },
  container = "pack",
  affcuredechos = false,
  autoshrugging = false,
  affgainedechos = false,
  manapercent = 10,
  usemoss = false,
  prompt = "@warning#red@paused@softpaused#DodgerBlue@retardation#yellow@phase#hcolour@healthh #mcolour@manam #ecolour@percentendurance%e #wcolour@percentwillpower%w @kai@shin#white@bal@bal#MidnightBlue|#white@eq@eq @invdef#DarkOrchid@mw@affs@diffhealth@diffmana",
  promptline2 = false,
  blackoutprompt = "@warning#red@paused@softpaused#DodgerBlue@retardation<black:grey>BLACKOUT-",
  monktransmuteto = 80,
  aeonsipmana = 40,
  parrystrategy = "manual",
  useclot = true,
  defprio = {
    basic = {
    },
  },
  precache = {
    basic = {
    },
  },
  magirobes = false,
  haveparry = false,
  mount = "mule",
  stopinsomnia = false,
  focusshifts = {
    basic = {
    },
  },
  havebreathing = false,
  siphealth = 80,
  gagdefshift = true,
  
  defup = {
    basic = {
    },
  },
  autoshrugat = 3,
  sipmana = 80,
  mosshealth = 80,
  mossmana = 80,
  usetransmutation = true,
  monktransmute = false,
  havedeathsight = false,
  userage = false,
  gstuff = true,
  aeonsiphealth = 40,
  treebaltime = 15,
  haveinsomnia = false,
  manaPercent = 10,
  aeonblock = true,
  haveclot = false,
  dform = false,
  usefocus = false,
  unsoftpausehealth = 75,
  keepup = {
    basic = {
    },
  },
  havefocus = false,
  stopfocus = false,
  stopclot = false,
  profilenames = {"basic"},
  profileondeath = "basic",
  profileonburst = "basic",
  autotree = false,
  automount = false,
  havevault = true,
	curingsets = false
}
  if not no_save then
    wsys.saveSettings()
  end
end

--save table in external file
function wsys.saveSettings(echo)
  if string.char(getMudletHomeDir():byte()) == "/" then 
    _sep = "/" 
  else 
    _sep = "\\" 
  end -- if
  local serverside_settings = getMudletHomeDir().._sep.."wsys_settings.lua"
  table.save(serverside_settings, wsys.settings)
  if echo then wsys.report("Setting saved") end
end

--in here so the first install doesn't throw errors
-- REPORT
function wsys.report(message)
 cecho("\n<LimeGreen>[<DodgerBlue>WunderSys<LimeGreen>]: <snow>" .. message)
end
--

--load table from external file
function wsys.loadSettings()
  if string.char(getMudletHomeDir():byte()) == "/" then 
    _sep = "/" 
  else 
    _sep = "\\" 
  end -- if
  local serverside_settings = getMudletHomeDir().._sep.."wsys_settings.lua"
  if (io.exists(serverside_settings)) then
   table.load(serverside_settings, wsys.settings)
   wsys.report("Loaded the settings")
  else
   wsys.return_defaultsettings()
   wsys.report("<red>No settings file found, loaded default settings.")
  end -- if
end

if wsys.settings then
  wsys.saveSettings()
end
wsys.return_defaultsettings(true)
wsys.loadSettings()
