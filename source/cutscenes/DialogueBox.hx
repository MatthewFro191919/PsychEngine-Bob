package cutscenes;

import flixel.addons.text.FlxTypeText;
import backend.Song;

class DialogueBox extends FlxSpriteGroup
{
	var box:FlxSprite;

	var curCharacter:String = '';

	var dialogueList:Array<String> = [];

	// SECOND DIALOGUE FOR THE PIXEL SHIT INSTEAD???
	var swagDialogue:FlxTypeText;

	public var finishThing:Void->Void;
	public var nextDialogueThing:Void->Void = null;
	public var skipDialogueThing:Void->Void = null;
	var portraitLeft:FlxSprite;
	var portraitRight:FlxSprite;

	var handSelect:FlxSprite;
	var bgFade:FlxSprite;
	var skipText:FlxText;

	var dialogue:Alphabet;
	// SECOND DIALOGUE FOR THE PIXEL SHIT INSTEAD???
	var dropText:FlxText;

	var caniskip:Bool = true;

	var portraitGloop:FlxSprite;
	var portraitRightBF:FlxSprite;
	var portraitRightGF:FlxSprite;

	var BOOM:FlxSound;

	var songName:String = Paths.formatToSongPath(Song.loadedSongName);
	public function new(talkingRight:Bool = true, ?dialogueList:Array<String>)
	{
		super();

		bgFade = new FlxSprite(-200, -200).makeGraphic(Std.int(FlxG.width * 1.3), Std.int(FlxG.height * 1.3), 0xFFB3DFd8);
		bgFade.scrollFactor.set();
		bgFade.alpha = 0;
		add(bgFade);

		new FlxTimer().start(0.83, function(tmr:FlxTimer)
		{
			bgFade.alpha += (1 / 5) * 0.7;
			if (bgFade.alpha > 0.7)
				bgFade.alpha = 0.7;
		}, 5);

		box = new FlxSprite(-20, 45);
		
		var hasDialog = true;
		switch (songName)
		{
			case 'senpai':
				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-pixel');
				box.animation.addByPrefix('normalOpen', 'Text Box Appear', 24, false);
				box.animation.addByIndices('normal', 'Text Box Appear instance 1', [4], '', 24);
			case 'roses':
				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-senpaiMad');
				box.animation.addByPrefix('normalOpen', 'SENPAI ANGRY IMPACT SPEECH', 24, false);
				box.animation.addByIndices('normal', 'SENPAI ANGRY IMPACT SPEECH instance 1', [4], '', 24);
			case 'thorns':
				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-evil');
				box.animation.addByPrefix('normalOpen', 'Spirit Textbox spawn', 24, false);
				box.animation.addByIndices('normal', 'Spirit Textbox spawn instance 1', [11], '', 24);

				var face:FlxSprite = new FlxSprite(320, 170).loadGraphic(Paths.image('weeb/spiritFaceForward'));
				face.setGraphicSize(Std.int(face.width * 6));
				add(face);
			case 'sunshine':
				box = new FlxSprite(0, 0);
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('bob/dialogueBox-bob');
				box.animation.addByPrefix('normalOpen', 'Text Box Appear', 24, false);
				box.animation.addByIndices('normal', 'Text Box Appear', [4], "", 24);
				box.animation.addByPrefix('bobCRUSH', 'Bob DESTROYS the dialog box DAYUMNNNN', 24, false);
			case 'withered':
				box = new FlxSprite(0, 0);
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('bob/dialogueBox-bob');
				box.animation.addByPrefix('normalOpen', 'Text Box Appear', 24, false);
				box.animation.addByIndices('normal', 'Text Box Appear', [4], "", 24);
				box.animation.addByPrefix('bobCRUSH', 'Bob DESTROYS the dialog box DAYUMNNNN', 24, false);
			case 'run':
				box = new FlxSprite(0, 0);
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('bob/dialogueBox-bobevil');
				box.animation.addByPrefix('normalOpen', 'Text Box Appear', 24, false);
				box.animation.addByIndices('normal', 'Text Box Appear', [4], "", 24);
			case 'ron':
				box = new FlxSprite(0, 0);
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('bob/dialogueBox-bob');
				box.animation.addByPrefix('normalOpen', 'Text Box Appear', 24, false);
				box.animation.addByIndices('normal', 'Text Box Appear', [4], "", 24);
				box.animation.addByPrefix('bobCRUSH', 'Bob DESTROYS the dialog box DAYUMNNNN', 24, false);
			case 'trouble':
				box = new FlxSprite(0, 0);
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('bob/dialogueBox-bob');
				box.animation.addByPrefix('normalOpen', 'Text Box Appear', 24, false);
				box.animation.addByIndices('normal', 'Text Box Appear', [4], "", 24);
				box.animation.addByPrefix('bobCRUSH', 'Bob DESTROYS the dialog box DAYUMNNNN', 24, false);
			case 'onslaught':
				box = new FlxSprite(0, 0);
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('bob/dialogueBox-bob');
				box.animation.addByPrefix('normalOpen', 'Text Box Appear', 24, false);
				box.animation.addByIndices('normal', 'Text Box Appear', [4], "", 24);
				box.animation.addByPrefix('bobCRUSH', 'Bob DESTROYS the dialog box DAYUMNNNN', 24, false);
			default:
				hasDialog = false;
		}

		this.dialogueList = dialogueList;
		
		if (!hasDialog)
			return;
		
		this.dialogueList = dialogueList;
		if (PlayState.SONG.song.toLowerCase() == 'onslaught')
		{
			portraitGloop = new FlxSprite(0, 0);
			portraitGloop.frames = Paths.getSparrowAtlas('bob/glitchedBobPortrait');
			portraitGloop.animation.addByPrefix('enter', 'Bob Enter', 24, false);
			portraitGloop.updateHitbox();
			portraitGloop.scrollFactor.set();
			add(portraitGloop);
			portraitGloop.visible = false;
		}
		else
		{
			portraitGloop = new FlxSprite(0, 0);
			portraitGloop.frames = Paths.getSparrowAtlas('bob/gloopBobPortrait');
			portraitGloop.animation.addByPrefix('enter', 'Bob Enter', 24, false);
			portraitGloop.updateHitbox();
			portraitGloop.scrollFactor.set();
			add(portraitGloop);
			portraitGloop.visible = false;
		}
		if (!hasDialog)
			return;

		if (PlayState.SONG.song.toLowerCase() == 'senpai' || PlayState.SONG.song.toLowerCase() == 'roses' || PlayState.SONG.song.toLowerCase() == 'thorns')
		{
			portraitLeft = new FlxSprite(-20, 40);
			portraitLeft.frames = Paths.getSparrowAtlas('weeb/senpaiPortrait');
			portraitLeft.animation.addByPrefix('enter', 'Senpai Portrait Enter', 24, false);
			portraitLeft.setGraphicSize(Std.int(portraitLeft.width * PlayState.daPixelZoom * 0.9));
			portraitLeft.updateHitbox();
			portraitLeft.scrollFactor.set();
			add(portraitLeft);
			portraitLeft.visible = false;
		}
		if (PlayState.SONG.song.toLowerCase() == 'sunshine')
		{
			portraitLeft = new FlxSprite(0, 0);
			portraitLeft.frames = Paths.getSparrowAtlas('bob/bobPortrait');
			portraitLeft.animation.addByPrefix('enter', 'Bob Portrait Enter', 24, false);
			portraitLeft.updateHitbox();
			portraitLeft.scrollFactor.set();
			add(portraitLeft);
			portraitLeft.visible = false;
		}
		if (PlayState.SONG.song.toLowerCase() == 'withered')
		{
			portraitLeft = new FlxSprite(0, 0);
			portraitLeft.frames = Paths.getSparrowAtlas('bob/bobPortraitPOAT');
			portraitLeft.animation.addByPrefix('enter', 'Bob Portrait Enter Mad', 24, false);
			portraitLeft.updateHitbox();
			portraitLeft.scrollFactor.set();
			add(portraitLeft);
			portraitLeft.visible = false;
		}
		if (PlayState.SONG.song.toLowerCase() == 'run')
		{
			portraitLeft = new FlxSprite(0, 0);
			portraitLeft.frames = Paths.getSparrowAtlas('bob/bobPortraitPOAT');
			portraitLeft.animation.addByPrefix('enter', 'Bob Portrait Enter HELL', 24, false);
			portraitLeft.updateHitbox();
			portraitLeft.scrollFactor.set();
			add(portraitLeft);
			portraitLeft.visible = false;
		}
		if (PlayState.SONG.song.toLowerCase() == 'ron' || PlayState.SONG.song.toLowerCase() == 'trouble')
		{
			portraitLeft = new FlxSprite(0, 0);
			portraitLeft.frames = Paths.getSparrowAtlas('bob/ronPortrait');
			portraitLeft.animation.addByPrefix('enter', 'Ron Enter', 24, false);
			portraitLeft.updateHitbox();
			portraitLeft.scrollFactor.set();
			add(portraitLeft);
			portraitLeft.visible = false;
		}

		portraitRight = new FlxSprite(0, 0);
		portraitRight.frames = Paths.getSparrowAtlas('bob/bfPortrait');
		portraitRight.animation.addByPrefix('enterNormal', 'Boyfriend portrait enter', 24, false);
		portraitRight.updateHitbox();
		portraitRight.scrollFactor.set();
		add(portraitRight);
		portraitRight.visible = false;

		portraitRightBF = new FlxSprite(0, 0);
		portraitRightBF.frames = Paths.getSparrowAtlas('bob/bfPortraitExpressions');
		portraitRightBF.animation.addByPrefix('enterSad', 'Boyfriend portrait enter sad', 24, false);
		portraitRightBF.animation.addByPrefix('enterShocked', 'Boyfriend portrait enter shocked', 24, false);
		portraitRightBF.updateHitbox();
		portraitRightBF.scrollFactor.set();
		add(portraitRightBF);
		portraitRightBF.visible = false;

		portraitRightGF = new FlxSprite(0, 0);
		portraitRightGF.frames = Paths.getSparrowAtlas('bob/WOOOOAH');
		portraitRightGF.animation.addByPrefix('enter', 'GF portrait enter', 24, false);
		portraitRightGF.updateHitbox();
		portraitRightGF.scrollFactor.set();
		add(portraitRightGF);
		portraitRightGF.visible = false;
		
		box.animation.play('normalOpen');
		if (PlayState.SONG.song.toLowerCase() == 'senpai' || PlayState.SONG.song.toLowerCase() == 'roses' || PlayState.SONG.song.toLowerCase() == 'thorns')
		{
			box.setGraphicSize(Std.int(box.width * PlayState.daPixelZoom * 0.9));

			handSelect = new FlxSprite(1042, 590).loadGraphic(Paths.image('weeb/pixelUI/hand_textbox'));
			handSelect.setGraphicSize(Std.int(handSelect.width * PlayState.daPixelZoom * 0.9));
			handSelect.updateHitbox();
			handSelect.visible = false;
			add(handSelect);

			swagDialogue = new FlxTypeText(240, 500, Std.int(FlxG.width * 0.6), '', 32);
			swagDialogue.font = Paths.font('pixel-latin.ttf');
			swagDialogue.color = 0xFF3F2021;
			swagDialogue.sounds = [FlxG.sound.load(Paths.sound('pixelText'), 0.6)];
			swagDialogue.borderStyle = SHADOW;
			swagDialogue.borderColor = 0xFFD89494;
			swagDialogue.shadowOffset.set(2, 2);
			add(swagDialogue);

			skipText = new FlxText(FlxG.width - 320, FlxG.height - 30, 300, Language.getPhrase('dialogue_skip', 'Press BACK to Skip'), 16);
			skipText.setFormat(null, 16, FlxColor.WHITE, RIGHT, OUTLINE_FAST, FlxColor.BLACK);
			skipText.borderSize = 2;
			add(skipText);
		}
		box.updateHitbox();
		add(box);

		box.screenCenter(X);

		if (PlayState.SONG.song.toLowerCase() == 'onslaught')
			portraitGloop.screenCenter(X);
		else
			portraitLeft.screenCenter(X);

		if (!talkingRight)
		{
			// box.flipX = true;
		}
		dropText = new FlxText(242, 438, Std.int(FlxG.width * 0.6), "", 32);
		dropText.font = 'Pixel Arial 11 Bold';
		dropText.color = 0xFFD89494;
		add(dropText);

		swagDialogue = new FlxTypeText(240, 436, Std.int(FlxG.width * 0.6), "", 32);
		swagDialogue.font = 'Pixel Arial 11 Bold';
		swagDialogue.color = 0xFF3F2021;
		swagDialogue.sounds = [FlxG.sound.load(Paths.sound('pixelText'), 0.6)];
		add(swagDialogue);

		dialogue = new Alphabet(0, 80, "", false, true);
		// dialogue.x = 90;
		// add(dialogue);
	}

	var dialogueOpened:Bool = false;
	var dialogueStarted:Bool = false;
	var dialogueEnded:Bool = false;

	override function update(elapsed:Float)
	{
		// HARD CODING CUZ IM STUPDI
		super.update(elapsed);

		switch(songName)
		{
			case 'roses':
				portraitLeft.visible = false;
			case 'thorns':
				portraitLeft.visible = false;
				swagDialogue.color = FlxColor.WHITE;
				swagDialogue.borderStyle = NONE;
		}

		if (box.animation.curAnim != null && box.animation.curAnim.name == 'normalOpen' && box.animation.curAnim.finished)
		{
			box.animation.play('normal');
			dialogueOpened = true;
		}

		if (dialogueOpened && !dialogueStarted)
		{
			startDialogue();
			dialogueStarted = true;
		}

		if(Controls.instance.BACK)
		{
			if (dialogueStarted && !isEnding)
			{
				dialogueCompleted();
				FlxG.sound.play(Paths.sound('clickText'), 0.8);
			}
		}
		else if(Controls.instance.ACCEPT)
		{
			if (dialogueEnded)
			{
				if (dialogueList[1] == null && dialogueList[0] != null)
				{
					if (!isEnding)
						dialogueCompleted();
				}
				else
				{
					dialogueList.remove(dialogueList[0]);
					startDialogue();
					FlxG.sound.play(Paths.sound('clickText'), 0.8);
				}
			}
			else if (dialogueStarted)
			{
				FlxG.sound.play(Paths.sound('clickText'), 0.8);
				swagDialogue.skip();
				
				if(skipDialogueThing != null) {
					skipDialogueThing();
				}
			}
		}
	}

	var isEnding:Bool = false;
	function dialogueCompleted()
	{
		isEnding = true;
		FlxG.sound.play(Paths.sound('clickText'), 0.8);	

		if (songName == 'senpai' || songName == 'thorns')
			FlxG.sound.music.fadeOut(1.5, 0, (_) -> FlxG.sound.music.stop());

		new FlxTimer().start(0.2, function(tmr:FlxTimer)
		{
			box.alpha -= 1 / 5;
			bgFade.alpha -= 1 / 5 * 0.7;
			portraitLeft.visible = false;
			portraitRight.visible = false;
			swagDialogue.alpha -= 1 / 5;
			handSelect.alpha -= 1 / 5;
		}, 5);

		swagDialogue.skip();
		skipText.visible = false;
		new FlxTimer().start(1.5, function(tmr:FlxTimer)
		{
			finishThing();
			kill();
		});
	}

	function startDialogue():Void
	{
		cleanDialog();
		// var theDialog:Alphabet = new Alphabet(0, 70, dialogueList[0], false, true);
		// dialogue = theDialog;
		// add(theDialog);

		// swagDialogue.text = ;
		swagDialogue.resetText(dialogueList[0]);
		swagDialogue.start(0.04, true);
		swagDialogue.completeCallback = function() {
			handSelect.visible = true;
			dialogueEnded = true;
		};

		handSelect.visible = false;
		dialogueEnded = false;
		switch (curCharacter)
		{
			case 'dad':
				portraitRight.visible = false;
				if (!portraitLeft.visible)
				{
					if (songName == 'senpai') portraitLeft.visible = true;
					portraitLeft.animation.play('enter');
				}
			case 'bf':
				portraitLeft.visible = false;
				if (!portraitRight.visible)
				{
					portraitRight.visible = true;
					portraitRight.animation.play('enter');
				}
		}
		if(nextDialogueThing != null)
			nextDialogueThing();
	}

	function cleanDialog():Void
	{
		var splitName:Array<String> = dialogueList[0].split(':');
		curCharacter = splitName[1];
		dialogueList[0] = dialogueList[0].substr(splitName[1].length + 2).trim();
	}
}
