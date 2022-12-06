
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
	if toggle_input == 'en' then
			Chinese()
			toggle_input = 'ch'
	else
			English()
			toggle_input = 'en'
	end
end

return toggleInputMethod