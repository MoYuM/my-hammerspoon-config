im = {}

im.toggle_input = 'ch'

function im.toggle()
	if im.toggle_input == 'en' then
			im.chinese()
	else
			im.english()
	end
end

function im.chinese()
	-- 简体拼音
	hs.keycodes.currentSourceID("com.apple.inputmethod.SCIM.ITABC")
	hs.alert.show('中')
	im.toggle_input = 'ch'
end

function im.english()
	-- ABC
	hs.keycodes.currentSourceID("com.apple.keylayout.ABC")
	hs.alert.show('Eng')
	im.toggle_input = 'en'
end

return im