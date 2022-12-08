local im = require('im')

hyper = hs.hotkey.modal.new({}, 'F18')

local function enterHyperMode()
  hyper.triggered = false
  enterTime = hs.timer.absoluteTime()
  hyper:enter()
end

local function exitHyperMode()
  local exitTime = hs.timer.absoluteTime()
  local openTime = (exitTime - enterTime) / 1000000
  hyper:exit()
  if not hyper.triggered and openTime < 500 then
    im.toggle()
  end
end

-- send a keyStroke with no delay
local function send(mods, key)
  hs.eventtap.keyStroke(mods, key, 0)
end

local hotKeyConfig = {
  {
    from = { {}, 'left' },
    to = 'S',
    canRepeat = true,
  },
  {
    from = { {}, 'down' },
    to = 'D',
    canRepeat = true,
  },
  {
    from = { {}, 'right' },
    to = 'F',
    canRepeat = true,
  },
  {
    from = { {}, 'up' },
    to = 'E',
    canRepeat = true,
  },
  {
    from = { { 'cmd' }, 'right' },
    to = ';',
  },
  {
    from = { { 'alt' }, 'up' },
    to = 'I',
    canRepeat = true,
  },
  {
    from = { { 'alt' }, 'down' },
    to = 'K',
    canRepeat = true,
  },
  {
    from = { { 'cmd' }, 'left' },
    to = 'J',
  },
  {
    from = { { 'alt' }, 'left' },
    to = 'O',
    canRepeat = true,
  },
  {
    from = { { 'alt' }, 'right' },
    to = 'P',
    canRepeat = true,
  },
  {
    from = { { 'cmd' }, 'G' },
    to = '=',
  },
  {
    from = { { 'cmd', 'shift' }, 'G' },
    to = '-',
  },
  {
    from = { { 'ctrl' }, '-' },
    to = '[',
  },
  {
    from = { { 'ctrl', 'shift' }, '-' },
    to = ']'
  }
}

hs.hotkey.bind({}, 'F17', enterHyperMode, exitHyperMode)

for _, config in ipairs(hotKeyConfig) do

  local function sendkeys()
    send(config.from[1], config.from[2])
    hyper.triggered = true
  end

  if (config.canRepeat) then
    hyper:bind({}, config.to, sendkeys, nil, sendkeys)
  else
    hyper:bind({}, config.to, sendkeys)
  end
end

-- [hyper + return => move to end of line + return] (will exit hyper)
hyper:bind({}, 'return', function()
  send({ 'cmd' }, 'right')
  hyper.triggered = true
  hyper:exit() -- must exit model to trigger 'return' again
  send({}, 'return')
end)
