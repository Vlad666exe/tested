function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Dust' then --Check if the note on the chart is a Dust Note
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'NotesKR/NOTE_assets_Dust'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashDisabled', true);
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashHue', 0); --wanted a custom splash, but it looks weird on KR, so i just removed the splashes for both.
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashSat', -20);
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashBrt', 1);
			setPropertyFromGroup('unspawnNotes', i, 'colorSwap.hue', 0);
			setPropertyFromGroup('unspawnNotes', i, 'colorSwap.saturation', 0);
			setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true);

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has penalties
			end
		end
	end
end

function onCreatePost()
makeLuaSprite('dust', 'Dust_image', 0, 0)
addLuaSprite('dust', true)
scaleObject('dust', 0.67, 0.67)
setObjectCamera('dust', 'other')
setProperty('dust.alpha', 0)
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Dust' then
	playSound('dust', 1)
	if difficulty == 2 then
	runTimer('removesomedust', 7, 1)
	elseif difficulty == 1 then
	runTimer('removesomedust', 5, 1)
	elseif difficulty == 0 then
	runTimer('removesomedust', 2, 1)
	end
	if getProperty('dust.alpha') < 1 then
	setProperty('dust.alpha', getProperty('dust.alpha')+0.1)
	end
    end
end

function onUpdate(elapsed)
	if getProperty('dust.alpha') == 1 then
	if difficulty == 2 then
	setProperty('health', 0)
	elseif difficulty == 1 and getProperty('health') > 0.1 then
	setProperty('health', getProperty('health')-0.008)
	elseif difficulty == 0 then
	end
	end
end

function noteMiss(id, direction, noteType, isSustainNote)
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'removesomedust' then
	setProperty('dust.alpha', getProperty('dust.alpha')-0.1)
	if getProperty('dust.alpha') > 0 then
	if difficulty == 2 then
	runTimer('removesomedust', 7, 1)
	elseif difficulty == 1 then
	runTimer('removesomedust', 5, 1)
	elseif difficulty == 0 then
	runTimer('removesomedust', 2, 1)
	end
	end
	end
end