local im = require('im')

function spacesWatcherHandler()
  im.english()
end

local spacesWatcher = hs.spaces.watcher.new(spacesWatcherHandler)

return spacesWatcher