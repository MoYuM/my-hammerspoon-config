local im = require('im')

local function toggleIM(appName)
	print(appName)
	if (appName == 'Code') then
		im.english()
	elseif (appName == '阿里钉') then
		im.chinese()
	elseif (appName == '阿里语雀') then
		im.chinese()
	elseif (appName == '微信') then
		im.chinese()
	elseif (appName == 'Warp') then
		im.english()
	end
end


function applicationWatcher(appName, eventType, appObject)
	if (eventType == hs.application.watcher.activated) then
		toggleIM(appName)
	end
end


local appWatcher = hs.application.watcher.new(applicationWatcher)
appWatcher:start()

function spacesWatcherHandler()

	appWatcher:stop()

	local window = hs.window.focusedWindow()
	if (window) then
		local appName = window:application():name()
		print(appName)
		toggleIM(appName)
	end

	appWatcher:start()
end

local spacesWatcher = hs.spaces.watcher.new(spacesWatcherHandler)
return spacesWatcher