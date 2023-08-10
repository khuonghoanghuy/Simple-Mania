package;

import flixel.FlxG;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class SelectState extends MainState
{
	var songs:Array<String>;
	var textSong:FlxTypedGroup<FlxText>;
	var curSelected:Int = 0;

	override public function create()
	{
		super.create();

		// chart will load on songData.txt
		songs = DataUtil.textFile(AssetPaths.songData__txt);
		trace("total song: " + songs);

		textSong = new FlxTypedGroup<FlxText>();
		add(textSong);

		for (i in 0...songs.length)
		{
			var list:FlxText = new FlxText(20, 20 + (i * 30), 0, songs[i], 16);
			list.ID = i;
			list.alignment = LEFT;
			textSong.add(list);
		}
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justPressed.UP)
			curSelected -= 1;

		if (FlxG.keys.justPressed.DOWN)
			curSelected += 1;

		if (curSelected < 0)
			curSelected = textSong.length - 1;

		if (curSelected >= textSong.length)
			curSelected = 0;

		textSong.forEach(function(txt:FlxText)
		{
			txt.color = FlxColor.WHITE;

			if (txt.ID == curSelected)
				txt.color = FlxColor.YELLOW;
		});

		if (FlxG.keys.justPressed.ENTER)
		{
			trace("song select: " + songs[curSelected]);
			PlayState.songName = songs[curSelected];
			FlxG.switchState(new PlayState());
		}
	}
}
