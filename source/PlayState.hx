package;

import Song.SongData;
import flixel.FlxG;
import flixel.text.FlxText;

class PlayState extends MainState
{
	public static var song:SongData;
	public static var songName:String = 'test';

	var scoreTxt:FlxText;
	var score:Int = 0;

	override public function create()
	{
		super.create();

		song = Song.parseJSON(songName);
		trace("song current playing:" + songName);

		scoreTxt = new FlxText(0, FlxG.height - 15, 0, "Score: " + score, 8);
		scoreTxt.scrollFactor.set();
		scoreTxt.alignment = LEFT;
		add(scoreTxt);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
