local appWatcher = require('appWatcher')
local spacesWatcher = require('spacesWatcher')
local im = require('im')

hyper = hs.hotkey.modal.new({}, 'F18')
hs.window.animationDuration = 0

appWatcher:start()
spacesWatcher:start()

function enterHyperMode()
	hyper.triggered = false
	enterTime = hs.timer.absoluteTime()
	hyper:enter()
end

function exitHyperMode()
	exitTime = hs.timer.absoluteTime()
	openTime = (exitTime - enterTime) / 1000000
	hyper:exit()
	if not hyper.triggered and openTime < 500 then
		im.toggle()
	end
end

hs.hotkey.bind({}, 'F17', enterHyperMode, exitHyperMode)

-- send a keyStroke with no delay
function send(mods, key)
	hs.eventtap.keyStroke(mods, key, 0)
end

-- [hyper + S => left]
hyper:bind({}, 'S', function()
	send({}, 'left')
	hyper.triggered = true
end, nil, function ()
	send({}, 'left')
	hyper.triggered = true
end)

-- [hyper + D => down]
hyper:bind({}, 'D', function()
	send({}, 'down')
	hyper.triggered = true
end, nil, function ()
	send({}, 'down')
	hyper.triggered = true
end)

-- [hyper + F => right]
hyper:bind({}, 'F', function()
	send({}, 'right')
	hyper.triggered = true
end, nil, function ()
	send({}, 'right')
	hyper.triggered = true
end)

-- [hyper + E => up]
hyper:bind({}, 'E', function()
	send({}, 'up')
	hyper.triggered = true
end, nil, function ()
	send({}, 'up')
	hyper.triggered = true
end)

-- [hyper + ; => move to end of line]
hyper:bind({}, ';', function()
	send({'cmd'}, 'right')
	hyper.triggered = true
end)

-- [hyper + return => move to end of line + return] (will exit hyper)
hyper:bind({}, 'return', function()
	send({'cmd'}, 'right')
	hyper.triggered = true
	hyper:exit() -- must exit model to trigger 'return' again
	send({}, 'return')
end)

-- [hyper + I => alt + up]
hyper:bind({}, 'I', function()
	send({'alt'}, 'up')
	hyper.triggered = true
end)

-- [hyper + K => alt + down]
hyper:bind({}, 'K', function()
	send({'alt'}, 'down')
	hyper.triggered = true
end)

-- [hyper + L => shift + ctrl + ,]
hyper:bind({}, 'L', function()
	send({'shift', 'ctrl'}, ',')
	hyper.triggered = true
end)

-- [hyper + J => cmd + left]
hyper:bind({}, 'J', function()
	send({'cmd'}, 'left')
	hyper.triggered = true
end)

-- [hyper + O => alt + left]
hyper:bind({}, 'O', function()
	send({'alt'}, 'left')
	hyper.triggered = true
end)

-- [hyper + P => alt + right]
hyper:bind({}, 'P', function()
send({'alt'}, 'right')
	hyper.triggered = true
end)

-- [hyper + =  => cmd + G]
hyper:bind({}, '=', function ()
	send({'cmd'}, 'G')
	hyper.triggered = true
end)

-- [hyper + -  => shift + cmd + G]
hyper:bind({}, '-', function ()
	send({'cmd', 'shift'}, 'G')
	hyper.triggered = true
end)

-- [hyper + [ => cmd + K + cmd + Q]
hyper:bind({}, '[', function ()
	send({'ctrl'}, '-')
	hyper.trigger = true
end)

-- [hyper + ] => shift + ctrl + =]
hyper:bind({}, ']', function ()
	send({'ctrl', 'shift'}, '-')
	hyper.trigger = true
end)
