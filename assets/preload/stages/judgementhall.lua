function onCreate()

	makeLuaSprite('bg', 'judgement/judgement', -267.35, -370.7);
	scaleObject('bg', 1, 1);
	setScrollFactor('bg', 1, 1);

	makeLuaSprite('bgi', 'judgement/ilumination', -267.35, -370.7);
	scaleObject('bgi', 1, 1);
	setScrollFactor('bgi', 1, 1);
	
	addLuaSprite('bg', false);
	addLuaSprite('bgi', false);
end