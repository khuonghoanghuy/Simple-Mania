package;

import flixel.FlxG;
import flixel.text.FlxText;

class MenuState extends MainState
{
    var text:FlxText;

	override public function create()
	{
		super.create();

        text = new FlxText(0, 0, 0, "Simple Mania", 32);
        text.screenCenter();
        add(text);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

        if (FlxG.keys.justPressed.ENTER) {
            trace("open state");
            FlxG.switchState(new SelectState());
        }
	}
}
