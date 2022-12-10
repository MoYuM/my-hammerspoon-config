require('keys')

hs.window.animationDuration = 0

local appWatcher = require('watcher')
appWatcher:start()

local caffeine = require('Caffeine')
caffeine:start()
