hs.loadSpoon("InputSourceSwitch")

spoon.InputSourceSwitch:setApplications({
    ["微信"] = "Pinyin - Simplified",
    ["飞书"] = "Pinyin - Simplified",
    ["iTerm2"] = "ABC",
    ["Code"] = "ABC"
})

spoon.InputSourceSwitch:start()