package;

import lime.utils.Assets;

using StringTools;

class DataUtil
{
	inline public static function textFile(path:String):Array<String>
	{
		var list:Array<String> = Assets.getText(path).trim().split('\n');
		for (i in 0...list.length)
		{
			list[i] = list[i].trim();
		}
		return list;
	}
}
