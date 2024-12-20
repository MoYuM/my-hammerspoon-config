hs.loadSpoon("InputSourceSwitch")
hs.loadSpoon("InputMethodIndicator")

spoon.InputSourceSwitch:setApplications({
    ["微信"] = "Pinyin - Simplified",
    ["飞书"] = "Pinyin - Simplified",
    ["iTerm2"] = "ABC",
    ["Code"] = "ABC"
})

spoon.InputMethodIndicator:start({
    mode = "onChange", -- the mode of the indicator
})

spoon.InputSourceSwitch:start()