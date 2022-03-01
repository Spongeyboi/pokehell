package;

import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxG;

class TitleState extends FlxState
{
    override public function create()
    {
        super.create();
      
        var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
        // bg.antialiasing = true;
        // bg.setGraphicSize(Std.int(bg.width * 0.6));
        // bg.updateHitbox();
        add(bg);
      
        var logo:FlxSprite = new FlxSprite().loadGraphic(Paths.image('title'));
        logo.screenCenter();
        logo.antialiasing = true;
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);
    }
}
