package;

import flixel.FlxG;

class MenuState extends MainState
{
	override public function create()
	{
		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

        if (FlxG.keys.justPressed.ENTER) {
            trace("open state");
        }
	}
}
