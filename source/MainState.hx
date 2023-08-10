package;

import flixel.FlxState;
#if debug
import flixel.addons.studio.FlxStudio;
#end

class MainState extends FlxState
{
	override public function create()
	{
		super.create();

		#if debug
		FlxStudio.create();
		#end
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
