package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.graphics.frames.FlxAtlasFrames;
import openfl.Assets;

class PlayState extends FlxState
{
    var eevee:FlxSprite;

    var canMove:Bool = true;

    override public function create()
    {
        super.create();
      
        eevee = new FlxSprite(-150, -100);
        eevee.screenCenter();
		eevee.frames = return FlxAtlasFrames.fromSparrow('assets/shared/images/char/eevee.png',Assets.getText('assets/shared/images/char/eevee.xml'));
		eevee.antialiasing = true;
		eevee.animation.addByPrefix('idle', 'idle', 24);
		eevee.animation.addByPrefix('walk', 'walk', 24);
		eevee.animation.play('idle');
		eevee.updateHitbox();
        add(eevee);
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);

        var wannaMove:Bool = FlxG.keys.pressed.LEFT || FlxG.keys.pressed.RIGHT || FlxG.keys.pressed.UP || FlxG.keys.pressed.DOWN;

        if (wannaMove && canMove){
            eevee.animation.play('walk');
        }else{
            eevee.animation.play('idle');
        }
    }
}
