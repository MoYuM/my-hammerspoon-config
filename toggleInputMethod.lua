
local function toggleInputMethod()
	local function Chinese()
			-- 简体拼音
			hs.keycodes.currentSourceID("com.apple.inputmethod.SCIM.ITABC")
			hs.alert.show('中')
	end
	local function English()
			-- ABC
			hs.keycodes.currentSourceID("com.apple.keylayout.ABC")
			hs.alert.show('Eng')
	end
	if toggle_input then
			Chinese()
			toggle_input = false
	else
			English()
			toggle_input = true
	end
end

return toggleInputMethod