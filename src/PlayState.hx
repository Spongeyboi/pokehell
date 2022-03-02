package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.graphics.frames.FlxAtlasFrames;
import openfl.Assets;

class PlayState extends FlxState
{
    var eevee:Player;
    override public function create()
    {
        super.create();

        eevee = new Player(20, 20);
        add(eevee);
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);
    }
}
