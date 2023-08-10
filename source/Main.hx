package;

import flixel.FlxGame;
import openfl.display.Sprite;
import openfl.display.FPS;

class Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(0, 0, MenuState));
		addChild(new FPS(0, 0, 0xFFFFFF));
	}
}
