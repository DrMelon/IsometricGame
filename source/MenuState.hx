package;

import nme.Assets;
import nme.geom.Rectangle;
import nme.net.SharedObject;
import org.flixel.FlxButton;
import org.flixel.FlxG;
import org.flixel.FlxPath;
import org.flixel.FlxSave;
import org.flixel.FlxSprite;
import org.flixel.FlxState;
import org.flixel.FlxText;
import org.flixel.FlxU;
import org.flixel.plugin.photonstorm.FlxButtonPlus;

class MenuState extends FlxState
{
	private var StartBtn:FlxButtonPlus;
	private var StartBtnSprite:FlxSprite;
	
	override public function create():Void
	{
		// Haxeflixel Setup Stuff
		#if !neko
		FlxG.bgColor = 0xff081629;
		#else
		FlxG.camera.bgColor = {rgb: 0x081629, a: 0xff};
		#end		
		#if !FLX_NO_MOUSE
		FlxG.mouse.show();
		#end
		
		// Load assets for menu screen.
		
		StartBtnSprite = new FlxSprite(0, 0);
		StartBtnSprite.loadGraphic("assets/start.png");
		
		StartBtn = new FlxButtonPlus(160 - 32, 120 - 16, StartGame); // #yolo
		StartBtn.loadGraphic(StartBtnSprite, StartBtnSprite);
		
		add(StartBtn);
		
		
	}
	
	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{
		super.update();
	}	
	
	public function StartGame():Void
	{
		//Switch state
		FlxG.switchState(new PlayState());
	}
}