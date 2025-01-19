package states.stages;

import Song.*;
import states.stages.objects.*;
import flixel.addons.effects.chainable.FlxGlitchEffect;
import substates.GameOverSubstate;
import cutscenes.DialogueBox;
import states.FreeplayState;
import openfl.Lib;
import PlayState.*;

class BobStage extends BaseStage
{	
	var offsetTesting:Bool = false;
	var offsetTest:Float = 0;
	var health:Float = 1;
	var strumLineNotes:FlxTypedGroup<FlxSprite>;
	var playerStrums:FlxTypedGroup<FlxSprite>;
	var rep:Replay;
	var loadRep:Bool = false;
        var vocals:FlxSound;
        var bobmadshake:FlxSprite;
        var bobsound:FlxSound;
	var campaignScore:Int = 0;
	var storyPlaylist:Array<String> = [];
	var storyDifficulty:Int = 1;
	var SONG:SwagSong;

	override function create()
	{
		switch (SONG.song.toLowerCase())
		{
			case 'sunshine' :
			{
				var bg:FlxSprite = new FlxSprite(-100).loadGraphic(Paths.image('bob/happysky'));
				bg.updateHitbox();
				bg.active = false;
				bg.antialiasing = true;
				bg.scrollFactor.set(0.1, 0.1);
				add(bg);
				
				var ground:FlxSprite = new FlxSprite(-537, -158).loadGraphic(Paths.image('bob/happyground'));
				ground.updateHitbox();
				ground.active = false;
				ground.antialiasing = true;
				add(ground);
			}
			
			case 'withered' :
			{
				var bg:FlxSprite = new FlxSprite( -100).loadGraphic(Paths.image('bob/slightlyannyoed_sky'));
				bg.updateHitbox();
				bg.active = false;
				bg.antialiasing = true;
				bg.scrollFactor.set(0.1, 0.1);
				add(bg);
				
				var ground:FlxSprite = new FlxSprite(-537, -158).loadGraphic(Paths.image('bob/slightlyannyoed_ground'));
				ground.updateHitbox();
				ground.active = false;
				ground.antialiasing = true;
				add(ground);
			}
			
			//phlox is a little baby
			case 'run' | 'run-remix-because-its-cool' :
			{
				if (FlxG.save.data.happybob)
				{
					var bg:FlxSprite = new FlxSprite( -100).loadGraphic(Paths.image('bob/happy/hell'));
				bg.updateHitbox();
				bg.active = false;
				bg.antialiasing = true;
				bg.scrollFactor.set(0.1, 0.1);
				add(bg);
				
				var thingidk:FlxSprite = new FlxSprite( -271).loadGraphic(Paths.image('bob/happy/middlething'));
				thingidk.updateHitbox();
				thingidk.active = false;
				thingidk.antialiasing = true;
				thingidk.scrollFactor.set(0.3, 0.3);
				add(thingidk);
				
				var dead:FlxSprite = new FlxSprite( -60, 50).loadGraphic(Paths.image('bob/happy/theydead'));
				dead.updateHitbox();
				dead.active = false;
				dead.antialiasing = true;
				dead.scrollFactor.set(0.8, 0.8);
				add(dead);

				var ground:FlxSprite = new FlxSprite(-537, -158).loadGraphic(Paths.image('bob/happy/ground'));
				ground.updateHitbox();
				ground.active = false;
				ground.antialiasing = true;
				add(ground);
				
				bobmadshake = new FlxSprite( -198, -118).loadGraphic(Paths.image('bob/happy/bobscreen'));
				bobmadshake.scrollFactor.set(0, 0);
				bobmadshake.visible = false;
				}
				else
				{
					var bg:FlxSprite = new FlxSprite( -100).loadGraphic(Paths.image('bob/hell'));
				bg.updateHitbox();
				bg.active = false;
				bg.antialiasing = true;
				bg.scrollFactor.set(0.1, 0.1);
				add(bg);
				
				var thingidk:FlxSprite = new FlxSprite( -271).loadGraphic(Paths.image('bob/middlething'));
				thingidk.updateHitbox();
				thingidk.active = false;
				thingidk.antialiasing = true;
				thingidk.scrollFactor.set(0.3, 0.3);
				add(thingidk);
				
				var dead:FlxSprite = new FlxSprite( -60, 50).loadGraphic(Paths.image('bob/theydead'));
				dead.updateHitbox();
				dead.active = false;
				dead.antialiasing = true;
				dead.scrollFactor.set(0.8, 0.8);
				add(dead);

				var ground:FlxSprite = new FlxSprite(-537, -158).loadGraphic(Paths.image('bob/ground'));
				ground.updateHitbox();
				ground.active = false;
				ground.antialiasing = true;
				add(ground);
				
				bobmadshake = new FlxSprite( -198, -118).loadGraphic(Paths.image('bob/bobscreen'));
				bobmadshake.scrollFactor.set(0, 0);
				bobmadshake.visible = false;
				}
				
				bobsound = new FlxSound().loadEmbedded(Paths.sound('bobscreen'));
				
			}
			case 'onslaught' :
			{
				defaultCamZoom = 0.9;
				var bg:FlxSprite = new FlxSprite(-100).loadGraphic(Paths.image('bob/scary_sky'));
				bg.updateHitbox();
				bg.active = false;
				bg.antialiasing = true;
				bg.scrollFactor.set(0.1, 0.1);
				add(bg);
				/*var glitchEffect = new FlxGlitchEffect(8,10,0.4,FlxGlitchDirection.HORIZONTAL);
				var glitchSprite = new FlxEffectSprite(bg, [glitchEffect]);
				add(glitchSprite);*/
				
				var ground:FlxSprite = new FlxSprite(-537, -158).loadGraphic(Paths.image('bob/GlitchedGround'));
				ground.updateHitbox();
				ground.active = false;
				ground.antialiasing = true;
				add(ground);
				
			}
			case 'trouble' :
				{
					defaultCamZoom = 0.9;
					var bg:FlxSprite = new FlxSprite(-100,10).loadGraphic(Paths.image('bob/nothappy_sky'));
					bg.updateHitbox();
					bg.scale.x = 1.2;
					bg.scale.y = 1.2;
					bg.active = false;
					bg.antialiasing = true;
					bg.scrollFactor.set(0.1, 0.1);
					add(bg);
					/*var glitchEffect = new FlxGlitchEffect(8,10,0.4,FlxGlitchDirection.HORIZONTAL);
					var glitchSprite = new FlxEffectSprite(bg, [glitchEffect]);
					add(glitchSprite);*/
					
					var ground:FlxSprite = new FlxSprite(-537, -250).loadGraphic(Paths.image('bob/nothappy_ground'));
					ground.updateHitbox();
					ground.active = false;
					ground.antialiasing = true;
					add(ground);

					var deadron:FlxSprite = new FlxSprite(-700, 600).loadGraphic(Paths.image('bob/GoodHeDied'));
					deadron.updateHitbox();
					deadron.active = false;
					deadron.scale.x = 0.8;
					deadron.scale.y = 0.8;
					deadron.antialiasing = true;
					add(deadron);
					
				}
			case 'ron' | 'little-man':
				{
				defaultCamZoom = 0.9;
				var bg:FlxSprite = new FlxSprite(-100,10).loadGraphic(Paths.image('bob/happyRon_sky'));
				bg.updateHitbox();
				bg.scale.x = 1.2;
				bg.scale.y = 1.2;
				bg.active = false;
				bg.antialiasing = true;
				bg.scrollFactor.set(0.1, 0.1);
				add(bg);
				/*var glitchEffect = new FlxGlitchEffect(8,10,0.4,FlxGlitchDirection.HORIZONTAL);
				var glitchSprite = new FlxEffectSprite(bg, [glitchEffect]);
				add(glitchSprite);*/
				
				var ground:FlxSprite = new FlxSprite(-537, -250).loadGraphic(Paths.image('bob/happyRon_ground'));
				ground.updateHitbox();
				ground.active = false;
				ground.antialiasing = true;
				add(ground);
					
				}
    }
	}
		
	var isbobmad:Bool = true;
	var appearscreen:Bool = true;
	function shakescreen()
	{
		new FlxTimer().start(0.01, function(tmr:FlxTimer)
		{
			Lib.application.window.move(Lib.application.window.x + FlxG.random.int( -10, 10),Lib.application.window.y + FlxG.random.int( -8, 8));
		}, 50);
	}
	function HealthDrain():Void
	{
		FlxG.sound.play(Paths.sound("BoomCloud"), 1);
		boyfriend.playAnim("hit", true);
		FlxG.camera.zoom -= 0.02;
		new FlxTimer().start(0.3, function(tmr:FlxTimer)
		{
			boyfriend.playAnim("idle", true);
		});
		new FlxTimer().start(0.01, function(tmr:FlxTimer)
		{
			health -= 0.005;
		}, 300);
	}
	function resetBobismad():Void
	{
		camHUD.visible = true;
		bobsound.pause();
		bobmadshake.visible = false;
		bobsound.volume = 0;
		isbobmad = true;
	}
	function InvisibleNotes()
	{
		FlxG.sound.play(Paths.sound('Meow'));
		for (note in playerStrums)
			{
				note.visible = false;
			}
		for (note in strumLineNotes)
			{
				note.visible = false;
			}
	}
	function VisibleNotes()
	{
		FlxG.sound.play(Paths.sound('woeM'));
		for (note in playerStrums)
			{
				note.visible = true;
			}
		for (note in strumLineNotes)
			{
				note.visible = true;
			}
	}

	function Bobismad()
	{
		camHUD.visible = false;
		bobmadshake.visible = true;
		bobsound.play();
		bobsound.volume = 1;
		isbobmad = false;
		shakescreen();
		new FlxTimer().start(0.5 , function(tmr:FlxTimer)
		{
			resetBobismad();
		});
	}
	function BobIngameTransform()
	{
		//screw you aether i want to fix the ingame cutscene
		dad.playAnim('Transform', true);
		FlxG.sound.play(Paths.sound('bobSpooky'));
		var black:FlxSprite = new FlxSprite(-100, -100).makeGraphic(FlxG.width * 2, FlxG.height * 2, FlxColor.BLACK);
		black.scrollFactor.set();
		new FlxTimer().start(1.7, function(tmr:FlxTimer)
		{
			add(black);
			FlxG.camera.fade(FlxColor.WHITE, 0.1, true);
		});

	}
	function spotifyad()
		{
			var thx:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('littleman/spotifyad'));
			thx.updateHitbox();
			thx.scrollFactor.set(0, 0);
			thx.antialiasing = true;
			FlxG.camera.fade(FlxColor.BLACK, 1, false, function()
			{
				add(thx);
				FlxG.camera.fade(FlxColor.BLACK, 1, true);
			}, true);
		}
	function WindowGoBack()
		{
			new FlxTimer().start(0.01, function(tmr:FlxTimer)
			{
				var xLerp:Float = FlxMath.lerp(windowX, Lib.application.window.x, 0.95);
				var yLerp:Float = FlxMath.lerp(windowY, Lib.application.window.y, 0.95);
				Lib.application.window.move(Std.int(xLerp),Std.int(yLerp));
			}, 20);
		}
	function changeDadCharacter(id:String)
		{				
			var olddadx = dad.x;
			var olddady = dad.y;
			remove(dad);
			dad = new Character(olddadx, olddady, id);
			add(dad);
			iconP2.animation.play(id);
		}
	/*function loadFileAsString() 
	{
		var bruh:FlxSprite = new FlxSprite(FlxG.random.int(0, 775), FlxG.random.int(0, 442));
			bruh.loadGraphic(Paths.image('bob/Screen_Sky' + FlxG.random.int(1,3), 'shared'));
			bruh.antialiasing = true;
			bruh.active = false;
			bruh.width = bruh.width -50;
			bruh.scrollFactor.set();
			bruh.screenCenter();
			bruh.alpha = bruh.alpha -50;
		add(bruh);
		FlxTween.tween(bruh, {width: bruh.width + 50, alpha: bruh.alpha + 50}, 0.1, {ease: FlxEase.sineOut});
		bruh.cameras = [camHUD];
        }*/

	var doof:DialogueBox = null;
	function initDoof()
	{		
	  var file:String = Paths.txt('$songName/${songName}Dialogue_${ClientPrefs.data.language}'); //Checks for vanilla/Senpai dialogue
    
    switch (songName)
		{
			case 'sunshine':
		  	file = Paths.txt('sunshine/DumbDialogPhloxMade');
			case 'withered':
		  	file = Paths.txt('withered/DumbDialogPhloxMade');
			case 'run':
		  	file = Paths.txt('run/DumbDialogPhloxMade');
			case 'ron':
		  	file = Paths.txt('ron/ronDialogue');
			case 'trouble':
		  	file = Paths.txt('trouble/assfart');
			case 'onslaught':
		  	file = Paths.txt('onslaught/help');
		}
		#if MODS_ALLOWED
		if (!FileSystem.exists(file))
		#else
		if (!OpenFlAssets.exists(file))
		#end
		{
			file = Paths.txt('$songName/${songName}Dialogue');
		}

		#if MODS_ALLOWED
		if (!FileSystem.exists(file))
		#else
		if (!OpenFlAssets.exists(file))
		#end
		{
			startCountdown();
			return;
		}

		doof = new DialogueBox(false, CoolUtil.coolTextFile(file));
		doof.cameras = [camHUD];
		doof.scrollFactor.set();
		doof.finishThing = startCountdown;
		doof.nextDialogueThing = PlayState.instance.startNextDialogue;
		doof.skipDialogueThing = PlayState.instance.skipDialogue;
	}

	function endSong()
	{
		if (!loadRep)
			rep.SaveReplay();

		canPause = false;
		FlxG.sound.music.volume = 0;
		vocals.volume = 0;
		if (SONG.validScore)
		{
			#if !switch
			Highscore.saveScore(SONG.song, Math.round(songScore), storyDifficulty);
			#end
		}

		if (offsetTesting)
		{
			FlxG.sound.playMusic(Paths.music('freakyMenu'));
			offsetTesting = false;
			LoadingState.loadAndSwitchState(new OptionsMenu());
			FlxG.save.data.offset = offsetTest;
		}
		else
		{
			if (isStoryMode)
			{
				campaignScore += Math.round(songScore);

				storyPlaylist.remove(storyPlaylist[0]);

				if (storyPlaylist.length <= 0)
				{
					trace(curSong);
					#if windows
					DiscordClient.changePresence("HELP HELP HELP HELP HELP HELP HELP HELP HELP HELP HELP HELP HELP HELP HELP HELP HELP HELP HELP HELP HELP HELP HELP HELP HELP HELP HELP HELP HELP HELP HELP HELP HELP HELP HELP HELP HELP HELP HELP HELP HELP HELP HELP HELP HELP HELP", null, null, true);
					#end
					if (curSong.toLowerCase() == "run")
					{
						FlxG.switchState(new EndingState());
					}
					else if (curSong.toLowerCase() == "onslaught")
					{
						FlxG.switchState(new OnslaughtEndingState());
					}
					else
					{
						FlxG.sound.playMusic(Paths.music('freakyMenu'));

						transIn = FlxTransitionableState.defaultTransIn;
						transOut = FlxTransitionableState.defaultTransOut;

						FlxG.switchState(new StoryMenuState());

						// if ()
					}

					StoryMenuState.weekUnlocked[Std.int(Math.min(storyWeek + 1, StoryMenuState.weekUnlocked.length - 1))] = true;

					if (SONG.validScore)
					{
						NGio.unlockMedal(60961);
						Highscore.saveWeekScore(storyWeek, campaignScore, storyDifficulty);
					}

					FlxG.save.data.weekUnlocked = StoryMenuState.weekUnlocked;
					FlxG.save.flush();
				}
				else
				{
					var difficulty:String = "";

					if (storyDifficulty == 0)
						difficulty = '-easy';

					if (storyDifficulty == 2)
						difficulty = '-hard';

					trace('LOADING NEXT SONG');
					trace(PlayState.storyPlaylist[0].toLowerCase() + difficulty);

					if (SONG.song.toLowerCase() == 'eggnog')
					{
						var blackShit:FlxSprite = new FlxSprite(-FlxG.width * FlxG.camera.zoom,
							-FlxG.height * FlxG.camera.zoom).makeGraphic(FlxG.width * 3, FlxG.height * 3, FlxColor.BLACK);
						blackShit.scrollFactor.set();
						add(blackShit);
						camHUD.visible = false;

						FlxG.sound.play(Paths.sound('Lights_Shut_off'));
					}
			

					FlxTransitionableState.skipNextTransIn = true;
					FlxTransitionableState.skipNextTransOut = true;
					prevCamFollow = camFollow;

					var tempSong:String = SONG.song.toLowerCase();

					SONG = Song.loadFromJson(storyPlaylist[0].toLowerCase() + difficulty, storyPlaylist[0]);
					FlxG.sound.music.stop();

					if (tempSong == 'ron') 
					{
						LoadingState.loadAndSwitchState(new VideoState(Paths.video('ronEndCutscene'), new PlayState()));
					} else {
						LoadingState.loadAndSwitchState(new PlayState());
					}
				}
			}
			else
			{
				trace('WENT BACK TO FREEPLAY??');
				FlxG.switchState(new FreeplayState());
			}
		}
	}

	override function createPost()
	{
		// Use this function to layer things above characters!
	}

	override function update(elapsed:Float)
	{
		// Code here
	}

	override function destroy()
	{
		// Code here
	}

	
	override function countdownTick(count:Countdown, num:Int)
	{
		switch(count)
		{
			case THREE: //num 0
			case TWO: //num 1
			case ONE: //num 2
			case GO: //num 3
			case START: //num 4
		}
	}

	override function startSong()
	{
		// Code here
	}

	// Steps, Beats and Sections:
	//    curStep, curDecStep
	//    curBeat, curDecBeat
	//    curSection
	override function stepHit()
	{
		// Code here
	}
	override function beatHit()
	{
		// Code here
	}
	override function sectionHit()
	{
		// Code here
	}

	// Substates for pausing/resuming tweens and timers
	override function closeSubState()
	{
		if(paused)
		{
			//timer.active = true;
			//tween.active = true;
		}
	}

	override function openSubState(SubState:flixel.FlxSubState)
	{
		if(paused)
		{
			//timer.active = false;
			//tween.active = false;
		}
	}

	override function eventPushed(event:objects.Note.EventNote)
	{
		// used for preloading assets used on events that doesn't need different assets based on its values
		switch(event.event)
		{
			case "My Event":
				//precacheImage('myImage') //preloads images/myImage.png
				//precacheSound('mySound') //preloads sounds/mySound.ogg
				//precacheMusic('myMusic') //preloads music/myMusic.ogg
		}
	}

	override function noteMissPress(direction:Int)
	{
		// Code here
	}
}
