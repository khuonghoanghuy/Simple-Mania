package;

import Section.SectionData;
import haxe.Json;
import lime.utils.Assets;

using StringTools;

#if sys
import sys.FileSystem;
import sys.io.File;
#end

typedef SongData =
{
	var song:String;
	var notes:Array<SectionData>;
	var sections:Int;
	var sectionLengths:Array<Dynamic>;
	var bmp:Int;
	var speed:Float;
}

class Song
{
	public var song:String;
	public var notes:Array<SectionData>;
	public var sections:Int;
	public var sectionLengths:Array<Dynamic> = [];
	public var bpms:Int;
	public var speed:Float = 1;

	public function new(song, notes, bpms, sections)
	{
		// super();

		this.song = song;
		this.notes = notes;
		this.bpms = bpms;
		this.sections = sections;

		for (i in 0...notes.length)
		{
			this.sectionLengths.push(notes[i]);
		}
	}

	public static function parseJSON(jsonInput:String)
	{
		var json = Assets.getText('assets/data/' + jsonInput.toLowerCase() + '.json').trim();
		while (!json.endsWith("}"))
		{
			json = json.substr(0, json.length - 1);
		}
		var songData:SongData = cast Json.parse(json).song;
		return songData;
	}
}
