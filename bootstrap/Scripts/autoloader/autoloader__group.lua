local settings = getMudletHomeDir() .. '/settings.xml'
__settingsReloadTimer__ = nil
function settingsReloaded(_, path)
  if path == settings then
    if __settingsReloadTimer__ then killTimer(__settingsReloadTimer__) end
    removeFileWatch(settings)
    __settingsReloadTimer__ = tempTimer(0.25, function()
      cecho('\n<cyan>SETTINGS RELOADED WITH LATEST CHANGES\n')
      installPackage(settings)
      addFileWatch(settings)
    end)
  end
end

cecho('\n<cyan>Watching settings file for changes...\n')
addFileWatch(settings)
registerAnonymousEventHandler('sysPathChanged', settingsReloaded)
