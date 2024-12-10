flipped = false
-- Event notes hooks
function onEvent(name, value1, value2)
	if name == 'Camera Flip' then
	playSound('cameraFlip', 1)
	if flipped == true then
	flipped = false
	playAnim('dad', 'swing down', false);
	setProperty('dad.specialAnim', true);
	playAnim('boyfriend', 'hurt', false);
	setProperty('boyfriend.specialAnim', true);
	doTweenAngle('flipmalil', 'camGame', 210, 0.15, 'quadInOut')
	else
	flipped = true
	playAnim('dad', 'swing up', false);
	setProperty('dad.specialAnim', true);
	playAnim('boyfriend', 'hurt', false);
	setProperty('boyfriend.specialAnim', true);
	doTweenAngle('flipmalilup', 'camGame', -30, 0.15, 'quadInOut')
	end
	end
end

function onTweenCompleted(tag)
if tag == 'flipmalilup' then
doTweenAngle('flipma', 'camGame', 180, 0.15, 'quadInOut')
end
if tag == 'flipmalil' then
doTweenAngle('flipma', 'camGame', 0, 0.15, 'quadInOut')
end
if tag == 'flipma' then
triggerEvent('Screen Shake', '0.025, 0.1', '');
setProperty('boyfriend.specialAnim', false);
setProperty('dad.specialAnim', false);
end
end