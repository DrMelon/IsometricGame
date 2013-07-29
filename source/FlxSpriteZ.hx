package ;
import nme.Assets;
import nme.geom.Rectangle;
import nme.net.SharedObject;
import org.flixel.FlxButton;
import org.flixel.FlxG;
import org.flixel.FlxGroup;
import org.flixel.FlxPath;
import org.flixel.FlxSave;
import org.flixel.FlxSprite;
import org.flixel.FlxState;
import org.flixel.FlxText;
import org.flixel.FlxU;
/**
 * ...
 * @author J. Brown
 */

class FlxSpriteZ extends FlxSprite
{

	public var z:Float;
	
	public function new(x:Float, y:Float) 
	{
		super(x, y);
	}
	
}