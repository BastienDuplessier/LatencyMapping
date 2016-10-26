package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.text.FlxText;

class PlayState extends FlxState
{
	public var level:TiledLevel;

	public var score:FlxText;
	public var status:FlxText;
	public var coins:FlxGroup;
	public var player:FlxSprite;
	public var floor:FlxObject;
	public var exit:FlxSprite;

	private static var youDied:Bool = false;

	override public function create():Void
	{
		FlxG.mouse.visible = false;

		bgColor = 0xffaaaaaa;

		// Load the level's tilemaps
		level = new TiledLevel("assets/tiled/level.tmx", this);

		add(level.panorama);
		add(level.map);

	}

	override public function update(elapsed:Float):Void
	{
	}

}
