local awesomeCameraTwist = false
local coolAngle = 0

function onEvent(name, value1, value2)
	if name == 'Awesome Camera Twist' then
		if value1 == 'off' then
			awesomeCameraTwist = false
		end
		if value1 == 'on' then
			awesomeCameraTwist = true
		end
		coolAngle = value2
	end
end

function onBeatHit()
	if awesomeCameraTwist == true then
		if curBeat % 2 == 0 then
			setProperty("camGame.angle", -coolAngle)
			setProperty("camHUD.angle", -coolAngle)
			doTweenAngle("turn", "camGame", 0, crochet / 1000, "sineInOut")
			doTweenAngle("turn2", "camHUD", 0, crochet / 1000, "sineInOut")
		else
			setProperty("camGame.angle", coolAngle)
			setProperty("camHUD.angle", coolAngle)
			doTweenAngle("turn", "camGame", 0, crochet / 1000, "sineInOut")
			doTweenAngle("turn2", "camHUD", 0, crochet / 1000, "sineInOut")
		end
	end
end