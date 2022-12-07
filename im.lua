local color = require('color')


local style = {
	strokeWidth = 0,
	fillColor = color.white,
	strokeColor = color.white,
	textColor = color.orange,
	radius = 16,
	atScreenEdge = 2,
}

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
	hs.alert.closeAll()
	hs.alert.show('拼', style)
	im.toggle_input = 'ch'
end

function im.english()
	-- ABC
	hs.keycodes.currentSourceID("com.apple.keylayout.ABC")
	hs.alert.closeAll()
	hs.alert.show('ABC', style)
	im.toggle_input = 'en'
end

return im