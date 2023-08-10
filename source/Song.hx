package;

import Section.SectionData;
import haxe.Json;
import haxe.format.JsonParser;
import lime.utils.Assets;

typedef SongData = {
    var name:String;
    var notes:Array<SectionData>;
    var sections:Int;
    var sectionLengths:Array<Dynamic>;
    var bmp:Int;
    var speed:Float;
}

class Song
{
    public var name:String;
    public var notes:Array<SectionData>;
    public var sections:Int;
    public var sectionLengths:Array<Dynamic> = [];
    public var bmp:Int;
    public var speed:Float = 1;

    public function new()
    {
        super();

        this.name = name;
		this.notes = notes;
		this.bpm = bpm;
		this.sections = sections;

        for (i in 0...notes.length)
        {
            this.sectionLengths.push(notes[i]);
        }
    }

    public static function parseJSON(jsonInput:String)
    {
        var json = Assets.getText('assets/data/' + jsonInput.toLowerCase() + '.json').trim();
        while(!json.endsWith("}")) {
            json = json.substr(0, json.length - 1);
        }
        var songData:SongData = cast Json.parse(json).song;
        return songData;
    }
}