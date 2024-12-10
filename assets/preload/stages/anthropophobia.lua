local xx = -600; --400
local yy = 1375; --1375
local xx2 = 325; --1500
local yy2 = 1375; --750
local ofs = 15;
local followchars = true;
local del = 0;
local del2 = 0;
local damage = false;
local beating = false;
local beat_skip = 0;
local tp = false;
local tspeed = 0.5;

function onCreate()
	setProperty('skipCountdown', true)
	
	makeAnimatedLuaSprite('boneway','BG/dustdust/bone', 800, 50);
		addAnimationByPrefix('boneway', 'loop', 'bone', 32, false);
	addLuaSprite('boneway', true)
	setObjectCamera('boneway', 'hud');
	scaleObject('boneway',0.5,0.5)
	
end

function onCreatePost()
	
    setProperty('gf.alpha', 0);
	setProperty('boyfriend.alpha', 1);
	setProperty('camHUD.alpha', 0);
	
	triggerEvent('Camera Follow Pos',xx,yy)
	setProperty('camFollowPos.x',xx)
    setProperty('camFollowPos.y',yy)
	
	triggerEvent('Play Animation','start1','dad')

   

	makeLuaSprite('main','BG/dustdust/main', -1500, -350)
	addLuaSprite('main')
	setProperty('main.alpha', 0.5);
	
	makeLuaSprite('light','BG/dustdust/light', -1500, -350)
	addLuaSprite('light', true)
	setProperty('light.alpha', 0.5);
	setBlendMode('light', 'add')
	
	makeLuaSprite('1st','BG/dustdust/1st map', -2100, -350)
	addLuaSprite('1st')
	setProperty('1st.alpha', 0);
	
	makeLuaSprite('1stlight','BG/dustdust/1st light', -2100, -350)
	addLuaSprite('1stlight', true)
	setProperty('1stlight.alpha', 0);
	setBlendMode('1stlight', 'add')
	

	-----------------------------------------
	
	
	makeLuaSprite('darkflash','Flash', 0, 0)
	makeLuaSprite('flashwhite','flashwhite', 0, 0)
	
	makeLuaSprite('csdown','cutscene1', 0, 0)
	makeLuaSprite('csup','cutscene2', 0, 0)
	
	setProperty('darkflash.alpha', 0);
	setObjectCamera('darkflash', 'other');
	setProperty('flashwhite.alpha', 0);
	setObjectCamera('flashwhite', 'other');
	
	setProperty('csup.alpha', 1);
	setObjectCamera('csup', 'other');
	setProperty('csdown.alpha', 1);
	setObjectCamera('csdown', 'other');
	
	addLuaSprite('darkflash')
	addLuaSprite('flashwhite')
	addLuaSprite('csup')
	addLuaSprite('csdown')
	
	addCharacterToList('MTT-dark')
	addCharacterToList('MTT-bf-dark')
	addCharacterToList('MTT-gf-dark')
	addCharacterToList('MTT-EX')
	addCharacterToList('MTT-gf-core')
	
	precacheImage('1st')
	precacheImage('1stlight')
	
	addCharacterToList('dustdust 1st')
	middle = getPropertyFromClass('ClientPrefs', 'middleScroll')
end

function onBeatHit()
    if curBeat % 2 == 0 then
		if beating == true then
		 triggerEvent('Add Camera Zoom', 0.025, 0.045)
		end
	end
end

function onStepHit()
    if curStep == 9999 or curStep == 9999 then
	cuton();
	setObjectCamera('csup', 'hud');
	setObjectCamera('csdown', 'hud');
	end
	if curStep == 272 or curStep == 9999 then
	cutoff();
	end
    if curStep == 16 or curStep == 272 or curStep == 784 or curStep == 1552 then
	flash();
	end
	if curStep == 2064 or curStep == 9999 then
	flashdark();
	end
	if curStep == 9999 or curStep == 9999 then
	xx = -200;
    xx2 = 150; 
	end
	if curStep == 9999 or curStep == 9999 then
	xx = 50;
    xx2 = 50; 
	triggerEvent('Camera Follow Pos',xx,yy)
	end
	if curStep == 271 or curStep == 1552 then
	beating = true;
	end
	if curStep == 528 or curStep == 2192 then
	beating = false;
	end
	----
	if curStep == 1 then
	cuton();
	end
	if curStep == 10 then
	triggerEvent('Play Animation','start2','dad')
	end
	if curStep == 16 then
	xx = -400
	setProperty('camHUD.alpha', 1);
	setObjectCamera('csup', 'hud');
	setObjectCamera('csdown', 'hud');
	end
	if curStep == 781 then
	playAnim('boneway','loop', false);
	end
	if curStep == 272 then
	setProperty('main.alpha', 1);
	setProperty('light.alpha', 1);
	end
	if curStep == 784 then
	    if middle == false then
		tp = true;
	        for i=0, 3 do
		   		noteTweenX('NoteX'..i, i, _G['defaultOpponentStrumX'..i] + -650, 0.5, 'sineInOut')
				setPropertyFromGroup('strumLineNotes', i, 'alpha', 1)
	        end
			for i=0, 3 do
		   		noteTweenX('NoteX'..i+4, i+4, _G['defaultOpponentStrumX'..i] + 325, 0.3, 'linear')
				setPropertyFromGroup('strumLineNotes', i+4, 'alpha', 1)
	        end
	    end
	end
	if curStep == 784 then
	triggerEvent('Change Character',1,'dustdust 1st')
	xx = -600
	xx2 = xx
	setProperty('camFollowPos.x',xx)
    setProperty('camFollowPos.y',yy)
	setProperty('main.alpha', 0);
	setProperty('light.alpha', 0);
	setProperty('1st.alpha', 1);
	setProperty('1stlight.alpha', 1);
	end
	if curStep == 1296 then
	doTweenAlpha('changeperson1', 'dad', 0.75, 2, 'linear');
	doTweenAlpha('changeperson2', '1st', 0.75, 2, 'linear');
	doTweenAlpha('changeperson3', '1stlight', 0.75, 2, 'linear');
	end
	if curStep == 1536 then
	doTweenAlpha('changeperson1', 'dad', 0, 0.7, 'linear');
	doTweenAlpha('changeperson2', '1st', 0, 0.7, 'linear');
	doTweenAlpha('changeperson3', '1stlight', 0, 0.7, 'linear');
	end
	if curStep == 1552 then
	xx = -400
	xx2 = 325
	setProperty('camFollowPos.x',xx)
    setProperty('camFollowPos.y',yy)
	setProperty('main.alpha', 1);
	setProperty('light.alpha', 1);
	setProperty('dad.alpha', 1);
	triggerEvent('Change Character',1,'dustdust')
	end
	if curStep == 2064 then
	xx2 = 525;
	triggerEvent('Play Animation','start1','dad')
	setProperty('main.alpha', 0.7);
	setProperty('light.alpha', 0.7);
	end
	if curStep == 2192 then
	triggerEvent('Camera Follow Pos',xx,yy)
	doTweenAlpha('endfade', 'darkflash', 1, 2, 'linear');
	end
end



function onUpdate()
	
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
			if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
			end

        else

            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
			if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
			end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
    
end


function flash()
    setProperty('flashwhite.alpha', 1);
	doTweenAlpha('flashdown', 'flashwhite', 0, 0.5, 'linear');
end

function flashdark()
    setProperty('darkflash.alpha', 1);
	doTweenAlpha('flashdowndark', 'darkflash', 0, 3, 'linear');
end

function introflash()
    setProperty('darkflash.alpha', 0);
	doTweenAlpha('beepflash', 'darkflash', 1, 0.1, 'linear');
end

function introflash2()
    setProperty('darkflash.alpha', 1);
	doTweenAlpha('beepflash2', 'darkflash', 0, 0.1, 'linear');
end

function cuton()
    doTweenY('CSUPY', 'csup', 0, 1, 'CircInOut');
    doTweenY('SCDOWNY', 'csdown', 0, 1, 'CircInOut');
end

function cutoff()
    doTweenY('CSUPYend', 'csup', -100, 1, 'CircInOut');
    doTweenY('SCDOWNYend', 'csdown', 100, 1, 'CircInOut');
end

function opponentNoteHit()
    triggerEvent('Screen Shake','0.02, 0.01','0.1, 0.0075');
	
    health = getProperty('health')
        if getProperty('health') > 0.4 then
            setProperty('health', health- 0.02);
		end
    end