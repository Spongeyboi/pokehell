package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.util.FlxColor;
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
      
        var logo:FlxSprite = new FlxSprite().loadGraphic('assets/images/title.png');
        logo.screenCenter();
        logo.antialiasing = true;
        add(logo);
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);

        var pressedEnter:Bool = FlxG.keys.justPressed.ENTER;

        if (pressedEnter){
            FlxG.switchState(new PlayState());
        }
    }
}
