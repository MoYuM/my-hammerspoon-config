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
	hs.alert.show('拼')
	im.toggle_input = 'ch'
end

function im.english()
	-- ABC
	hs.keycodes.currentSourceID("com.apple.keylayout.ABC")
	hs.alert.show('ABC')
	im.toggle_input = 'en'
end

return im