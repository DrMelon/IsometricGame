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


class PlayState extends FlxState
{
	private var theWorld:IsoTilemap;
	
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
		
		//Flash
		FlxG.flash(0xFFFFFFFF, 0.5);
		
		//ZA WARUDO
		theWorld = new IsoTilemap();
		
		theWorld.DummyData();
		theWorld.generateFlxTiles();
		
		
		add(theWorld.flxSpace);
		
	}
	
	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{
		super.update();
	}	
	
}