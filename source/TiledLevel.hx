package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.addons.editors.tiled.TiledImageLayer;
import flixel.addons.editors.tiled.TiledImageTile;
import flixel.addons.editors.tiled.TiledLayer.TiledLayerType;
import flixel.addons.editors.tiled.TiledMap;
import flixel.addons.editors.tiled.TiledObject;
import flixel.addons.editors.tiled.TiledObjectLayer;
import flixel.addons.editors.tiled.TiledTileLayer;
import flixel.addons.editors.tiled.TiledTileSet;
import flixel.addons.editors.tiled.TiledTilePropertySet;
import flixel.group.FlxGroup;
import flixel.tile.FlxTilemap;
import flixel.addons.tile.FlxTilemapExt;
import flixel.addons.tile.FlxTileSpecial;
import haxe.io.Path;

/**
* @author Samuel Batista
*/
class TiledLevel extends TiledMap
{
	// Array of tilemaps used for collision
	public var map:FlxGroup;
  public var panorama:FlxGroup;

	public function new(tiledLevel:Dynamic, state:PlayState)
	{
		super(tiledLevel);

		map = new FlxGroup();

		// Load Tile Maps
		for (layer in layers)
		{
      trace("Salut");
			if (layer.type != TiledLayerType.TILE) continue;
			var tileLayer:TiledTileLayer = cast layer;
			var tileSheetName:String = "sewer_tileset";


			var tileSet:TiledTileSet = null;
			for (ts in tilesets)
			{
        trace(ts);
				if (ts.name == tileSheetName)
				{
					tileSet = ts;
					break;
				}
			}

			if (tileSet == null)
			throw "Tileset " + tileSheetName + " not found. Did you misspell the 'tilesheet' property in " + tileLayer.name + "' layer?";

			var imagePath 		= new Path(tileSet.imageSource);
			var processedPath 	= "assets/tiled/" + imagePath.file + "." + imagePath.ext;

			// could be a regular FlxTilemap if there are no animated tiles
			var tilemap = new FlxTilemapExt();
      trace(tileLayer.tileArray);
      trace(tileSet.firstGID);
			tilemap.loadMapFromArray(tileLayer.tileArray, width, height, processedPath,
				tileSet.tileWidth, tileSet.tileHeight, OFF, tileSet.firstGID, 1, 1);

			map.add(tilemap);
		}
	}
}
