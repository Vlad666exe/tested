haskr = false
healthdrained = 0
function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'KR' then --Check if the note on the chart is a Dust Note
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'NotesKR/NOTE_assets_KR'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashDisabled', true);
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashHue', 314); --wanted a custom splash, but it looks weird on KR, so i just removed the splashes for both.
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashSat', 100);
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashBrt', 100);
			setPropertyFromGroup('unspawnNotes', i, 'colorSwap.hue', 0);
			setPropertyFromGroup('unspawnNotes', i, 'colorSwap.saturation', 0);
			setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true);

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has penalties
			end
		end
	end
end

local function to_hex(rgb)-- i don't remember where i got this from, but this isn't mine. i wish i could credit who made it though, because it's super useful.
	return string.format("%x", (rgb[1] * 0x10000) + (rgb[2] * 0x100) + rgb[3])
end

function onCreatePost()
makeLuaSprite('kr', 'KR', getProperty('healthBar.x') + 770, getProperty('healthBar.y') - 15)
addLuaSprite('kr', true)
scaleObject('kr', 1, 1)
setObjectCamera('kr', 'hud')
setProperty('kr.alpha', 0)
dadbarcolors = to_hex(getProperty("dad.healthColorArray"))
bfbarcolors = to_hex(getProperty("boyfriend.healthColorArray"))
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'KR' then
	playAnim('boyfriend', 'singUPmiss', true)
	playSound('bone', 1)
	setProperty('kr.alpha', 1)
	haskr = true
	setHealthBarColors(dadbarcolors, 'f23dc8')
	setProperty('dustbficonKR.alpha', 1)
	setProperty('dustbficon.alpha', 0)
	healthdrained = 0
    end
end

function onUpdate(elapsed)
if haskr == true and healthdrained < 0.5 then
if difficulty == 2 or difficulty == 1 then
setProperty('health', getProperty('health')-0.0008)
elseif difficulty == 0 then
end
healthdrained = healthdrained+0.0008
end
if healthdrained >= 0.5 then
haskr = false
setProperty('dustbficonKR.alpha', 0)
setProperty('dustbficon.alpha', 1)
setHealthBarColors(dadbarcolors, bfbarcolors)
healthdrained = 0
setProperty('kr.alpha', 0)
end
end

function noteMiss(id, direction, noteType, isSustainNote)
end