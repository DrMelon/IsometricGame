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

class IsoTilemap 
{
	// IsoTilemaps are made of many FlxSprites, generated from map information.
	private var sizeX:Int;
	private var sizeY:Int;
	private var sizeZ:Int; 
	
	// Upleft/downright axis is X
	// Upright/downleft is Y
	// Vertical/3D is Z
	
	// Need an array - a 3d one
	private var mapArray:Array<Array<Array<Int>>>;
	
	
	public var flxSpace:FlxGroup; //flxgroup to draw things into (wait can we move flxgroups??? WHATEVER LOLLOLOL)
	

	
	public function new() 
	{
		sizeX = 10;
		sizeY = 10;
		sizeZ = 10;
		
		
		flxSpace = new FlxGroup();
		makeArray();
	}
	
	public function makeArray():Void
	{
		
		// Clear old array
		if (mapArray != null)
		{
			mapArray.splice(0, mapArray.length);
		}
		else 
		{
			mapArray = new Array();	
		}
		
		
		for (i in 0 ... sizeX)
			{
				mapArray[i] = new Array();
				for (j in 0 ... sizeY)
				{
					mapArray[i][j] = new Array();
					for (k in 0 ... sizeZ)
					{
						mapArray[i][j].push(0); // fill with 0s
					}
				}
			}
	}
	
	public function resizeMap(sx:Int, sy:Int, sz:Int):Void
	{
		sizeX = sx;
		sizeY = sy;
		sizeZ = sz;
		
		makeArray();
	}
	
	public function generateFlxTiles():Void
	{
		//clear tiles
		flxSpace.clear();
		// should probs kill stuff too but w/e
		
		for (i in 0 ... mapArray.length)
		{
		
			
			for (j in 0 ... mapArray[i].length)
			{
				
				
				for (k in 0 ... mapArray[i][j].length)
				{
					//reading map, probably want to read it in reverse order like bottom to top kinda thing??? w/e
					
					
					// seems a good place to go over map structure:
					
					// if there's a 1 somewhere, that means a floor exists here. any floors that are not on the 0 level
					// and have no neighbouring floor should have walls coming up to meet them, right? yea
					// that makes some sense, right? lol
					
					// a 0 will like have nuthin idk
					
					// guhhh let's just try this
					
					if (mapArray[i][j][k] == 1)
					{
						//make a floor tile appear on screen appropriately here
						
						var thisTile:FlxSpriteZ;
						// need an iso-world -> screen translator... I USED TO KNOW THIS AAAGHHHH >:CCCC
						thisTile = new FlxSpriteZ(0, 0);
						
						thisTile.loadGraphic("assets/tilesWIP.png", false, false, 32, 17); //32x16? frame 1 at least
						
						// should set up some constants...
						thisTile.frame = 0;
						
						
						IsoToScreen(thisTile, i, j, k);
						thisTile.z = (j/i) * k;
						//add to flxgroup
						flxSpace.add(thisTile);
						
						//need to add walls next... going bottom upwards as it were, because of the "blips"
						
						var thisWall:FlxSpriteZ;
						thisWall = new FlxSpriteZ(0, 0);
						
						thisWall.loadGraphic("assets/tilesWIP.png", false, false, 32, 16);
						thisWall.frame = 1;
						
						thisWall.x = thisTile.x;
						thisWall.y = thisTile.y + 9;
						thisWall.z = (j/i) * k;
						
						flxSpace.add(thisWall);
	
						
						
					}
					
				}
				
				
			}
			
			
		}
		
		
		//flxSpace.sort("y", 0);
		flxSpace.sort("z", 2);
		
		//why does this mess up?
		
		
	}
	
	private function IsoToScreen(target:FlxSprite, isoX:Int, isoY:Int, isoZ:Int):Void
	{
		var newX:Int;
		var newY:Int;
		var newZ:Int; // this wont even be a thing really, cause like z becomes y???
		
		// JUST had a thought... the array is like containing multiple "sheets" of XY coords right, so surely i is the 3rd dimension not k... W/e i'll get to that
		
		newX = isoX * 32;
		newY = isoY * 16;
		
		// newY might need Z stuff? 
		target.x = (newY) + (newX / 2);
		target.y = (newX / 4) - (newY / 2);
		target.y += isoZ * 8; //add 16 px per zlevel?
		target.y += 120;
		
	}
	
	// now i actually need some map data...
	public function DummyData():Void
	{
		mapArray[3][3][5] = 1;
		mapArray[3][4][5] = 1;
		mapArray[4][4][5] = 1;
		mapArray[4][3][5] = 1;
		
		//block
		mapArray[3][4][4] = 1;
		
		//spire
		//mapArray[4][3][4] = 1;
		//mapArray[4][3][3] = 1;
		//mapArray[4][3][2] = 1;
		
		// Need to order all elements based on distance to "camera"...
		
		// cause like, ysee - can't have the two separate lists because if i do that, pillars in front of stuff will be behind the walls.
	
	}
	
}