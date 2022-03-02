 package;

 import lime.utils.Assets;

 import flixel.FlxG;
 import flixel.FlxSprite;
 import flixel.math.FlxPoint;
 import flixel.util.FlxColor;
 import flixel.graphics.frames.FlxAtlasFrames;


 class Player extends FlxSprite
 {
     static inline var SPEED:Float = 200;


     public function new(x:Float = 0, y:Float = 0)
     {
         super(x, y);
         loadGraphic('assets/shared/images/char/eevee.png', true, 16, 16);
         frames = FlxAtlasFrames.fromSparrow('assets/shared/images/char/eevee.png', 'assets/shared/images/char/eevee.xml','shared'));
         drag.x = drag.y = 1600;
         animation.addByPrefix('idle', 'idle', 24);
         animation.addByPrefix('walk', 'walk', 24);
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
            var newAngle:Float = 0;
            if (up)
            {
                newAngle = -90;
                if (left)
                    newAngle -= 45;
                else if (right)
                    newAngle += 45;
                facing = UP;
            }
            else if (down)
            {
                newAngle = 90;
                if (left)
                    newAngle += 45;
                else if (right)
                    newAngle -= 45;
                facing = DOWN;
            }
            else if (left)
            {
                newAngle = 180;
                facing = LEFT;
            }
            else if (right)
            {
                newAngle = 0;
                facing = RIGHT;
            }

            // determine our velocity based on angle and speed
            velocity.set(SPEED, 0);
            velocity.rotate(FlxPoint.weak(0, 0), newAngle);

            // if the player is moving (velocity is not 0 for either axis), we need to change the animation to match their facing
            if ((velocity.x != 0 || velocity.y != 0) && touching == NONE) 
            {
                switch (facing)
                {
                    case LEFT, RIGHT:
                        animation.play("walk");
                    case UP:
                        animation.play("walk");
                    case DOWN:
                        animation.play("walk");
                    case _:
                }
            }


         }else{
             animation.play('idle');
         }
     }



     override function update(elapsed:Float)
     {
          updateMovement();
          super.update(elapsed);
     }
 }