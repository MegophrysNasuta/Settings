wsys.myVersion = "1.3"
wsys.currentVersion = wsys.currentVersion or wsys.myVersion
wsys.updateAvailable = wsys.updateAvailable or false
wsys.lastVersionCheck = wsys.lastVersionCheck or 0
wsys.downloadsURL = "https://github.com/tynil/WunderSys/releases"

local branch = "master"

local register_update_listeners = function( should_register )
	if wsys.events.dl_update_success then killAnonymousEventHandler( wsys.events.dl_update_success ) end
	if wsys.events.dl_update_fail then killAnonymousEventHandler( wsys.events.dl_update_fail ) end
	
	if should_register then
		wsys.events.dl_update_success = registerAnonymousEventHandler("sysDownloadDone", "wsys.downloadedVersionFile")
		wsys.events.dl_update_fail = registerAnonymousEventHandler("sysDownloadError", "wsys.downloadedFileError")
	end
end

-- download latest version number file
function wsys.checkForUpdates( force )
  -- Don't check for updates too often
  if force or ( os.time() - wsys.lastVersionCheck ) > ( 5 * 60 ) then
    wsys.lastVersionCheck = os.time()
    if string.char(getMudletHomeDir():byte()) == "/" then 
    	_sep = "/" 
    else 
    	_sep = "\\" 
    end -- if
    local current_version = getMudletHomeDir().._sep.."WunderSysVersion"
    
    register_update_listeners( true )
    downloadFile(current_version, "https://raw.githubusercontent.com/tynil/WunderSys/"..branch.."/WunderSysVersion")
  end
end


if wsys.events.sys_load_update then killAnonymousEventHandler( wsys.events.sys_load_update ) end
wsys.events.sys_load_update = registerAnonymousEventHandler("sysLoadEvent", "wsys.checkForUpdates")

function wsys.downloadedVersionFile(_, filename)
  -- is the file that downloaded ours?
  if not filename:match("WunderSysVersion", 1, true) then return end
  
  register_update_listeners( false )
  
  -- parse downloaded file for current version
  local ver = io.open(filename):read("*all")
  wsys.currentVersion = string.trim(ver)
  
  if wsys.currentVersion == wsys.myVersion then
    wsys.report("Running the latest WunderSys version: "..wsys.myVersion)
    wsys.updateAvailable = false
  else
    wsys.report("")
    cechoLink("<white>Update available (<green>"..wsys.currentVersion.."<white>). Click to download.", "wsys.downloadNow()", wsys.downloadsURL, true )
    wsys.updateAvailable = true
    wsys.updatePopup()
  end
end


function wsys.downloadedFileError(_, reason)
	wsys.lastVersionCheck = 0
	register_update_listeners( false )
	display(reason)
	wsys.report("Could not check for updates. Please check ")
	cechoLink( "<white>"..wsys.downloadsURL, [[wsys.downloadNow()]], wsys.downloadsURL, true )
end

function wsys.updatePopup()
wundersysDownloadContainer = Geyser.Container:new({
  name = "wundersysDownloadContainer",
  x = "10%", y = 0,
  width = 200, height = 75,
  })

wundersysDownloadBackground = Geyser.Label:new({
  name = "wundersysDownloadBackground",
  x = 0, y = 0,
  height = "100%", width = "100%",
  fgColor = "white",
  color = "dim_gray",
  message = [[<center>WunderSys Update Available!</center>]]
  },wundersysDownloadContainer)

wundersysDownloadBackground:setStyleSheet([[
  qproperty-alignment: 'AlignTop';
  background-color: rgba(105,105,105,90%);
]])

wundersysDownloadNowButton = Geyser.Label:new({
  name = "wundersysDownloadNowButton",
  x = 10, y = 20,
  height = 20, width = "90%",
  fgColor = "black",
  color = "LawnGreen",
  message = [[<center>Download Now!</center>]]
  }, wundersysDownloadContainer)

wundersysDownloadNowButton:setClickCallback("wsys.downloadNow")

wundersysDownloadLaterButton = Geyser.Label:new({
  name = "wundersysDownloadLaterButton",
  x = 10, y = 45,
  height = 20, width = "90%",
  fgColor = "white",
  color = "red",
  message = [[<center>Later!</center>]]
  }, wundersysDownloadContainer)

wundersysDownloadLaterButton:setClickCallback("wsys.downloadLater")

end

function wsys.downloadNow()
  openUrl(wsys.downloadsURL)
  wundersysDownloadContainer:hide()
end

function wsys.downloadLater()
  wundersysDownloadContainer:hide()
end
