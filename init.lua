hyper = hs.hotkey.modal.new({}, 'F18')
hs.window.animationDuration = 0
toggle_input = true

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
    toggleInputMethod()
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
end)

-- [hyper + D => down]
hyper:bind({}, 'D', function()
  send({}, 'down')
  hyper.triggered = true
end)

-- [hyper + F => right]
hyper:bind({}, 'F', function()
  send({}, 'right')
  hyper.triggered = true
end)

-- [hyper + E => up]
hyper:bind({}, 'E', function()
  send({}, 'up')
  hyper.triggered = true
end)

-- [hyper + ; => move to end of line]
hyper:bind({}, ';', function()
  send({'cmd'}, 'right')
  hyper.triggered = true
end)

-- [hyper + delete => escape]
hyper:bind({}, 'delete', function ()
  send({}, 'escape')
  hyper.triggered = true
end)

-- [hyper + return => move to end of line + return] (will exit hyper)
hyper:bind({}, 'return', function()
  send({'cmd'}, 'right')
  hyper.triggered = true
  hyper:exit() -- must exit model to trigger 'return' again
  send({}, 'return')
end)

-- [hyper + , => select current word and copy it]
hyper:bind({}, ',', function ()
  send({'alt'}, 'right')
  send({'alt', 'shift'}, 'left')
  send({'cmd'}, 'c')
  hyper.triggered = true
end)

-- [hyper + I => alt + up]
hyper:bind({}, 'I', function ()
  send({'alt'}, 'up')
  hyper.triggered = true
end)

-- [hyper + K => alt + down]
hyper:bind({}, 'K', function ()
  send({'alt'}, 'down')
  hyper.triggered = true
end)

-- [hyper + J => alt + left]
hyper:bind({}, 'J', function ()
  send({'alt'}, 'left')
  hyper.triggered = true
end)

-- [hyper + L => alt + right]
hyper:bind({}, 'L', function ()
  send({'alt'}, 'right')
  hyper.triggered = true
end)


function toggleInputMethod ()
  local function Chinese()
      -- 简体拼音
      hs.keycodes.currentSourceID("com.apple.inputmethod.SCIM.ITABC")
  end
  local function English()
      -- ABC
      hs.keycodes.currentSourceID("com.apple.keylayout.ABC")
  end
  if toggle_input then
    Chinese()
    toggle_input = false
  else
    English()
    toggle_input = true
  end
end
