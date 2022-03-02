package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.graphics.frames.FlxAtlasFrames;
import openfl.Assets;
import flixel.math.FlxPoint;

class PlayState extends FlxState
{
    var eevee:Player;
    
    override function update(elapsed:Float)
    {
        super.update(elapsed);
        eevee = new Player(20, 20);
        add(eevee);
    }
}
