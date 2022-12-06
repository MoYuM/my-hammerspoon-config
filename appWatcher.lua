local im = require('im')

function applicationWatcher(appName, eventType, appObject)
	print(appName)
	if (eventType == hs.application.watcher.activated) then
		if (appName == 'Code') then
			im.english()
		end
		if (appName == '阿里钉') then
			im.chinese()
		end
		if (appName == '阿里语雀') then
			im.chinese()
		end
	end
end

appWatcher = hs.application.watcher.new(applicationWatcher)

return appWatcher