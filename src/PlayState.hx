package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.graphics.frames.FlxAtlasFrames;
import openfl.Assets;

class PlayState extends FlxState
{
    var eevee:Player;

     static inline var SPEED:Float = 200;
    

    override public function create()
    {
        super.create();

        eevee = new Player(20, 20);
        add(eevee);
        drag.x = drag.y = 1600;
    }

     function updateMovement()
    {
        var up:Bool = false;
        var down:Bool = false;
        var left:Bool = false;
        var right:Bool = false;

        up = FlxG.keys.anyPressed([UP, W]);
        down = FlxG.keys.anyPressed([DOWN, S]);
        left = FlxG.keys.anyPressed([LEFT, A]);
        right = FlxG.keys.anyPressed([RIGHT, D]);

           if (up && down)
                up = down = false;
            if (left && right)
                left = right = false;
        
            if (up || down || left || right)
            {
                velocity.x = speed;
                velocity.y = speed;

                var newAngle:Float = 0;
                if (up)
                {
                    newAngle = -90;
                    if (left)
                        newAngle -= 45;
                    else if (right)
                        newAngle += 45;
                }
                else if (down)
                {
                    newAngle = 90;
                    if (left)
                        newAngle += 45;
                    else if (right)
                        newAngle -= 45;
                }
                else if (left)
                    newAngle = 180;
                else if (right)
                    newAngle = 0;

                velocity.set(SPEED, 0);
                velocity.rotate(FlxPoint.weak(0, 0), newAngle);
            }
    }

    override function update(elapsed:Float)
    {
        updateMovement();
        super.update(elapsed);
    }
}
