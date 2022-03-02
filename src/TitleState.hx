package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.ui.FlxButton;

class TitleState extends FlxState
{
    var playButton:FlxButton;

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

         playButton = new FlxButton(0, 0, "Play", function(){
             FlxG.switchState(new PlayState());
         });
         playButton.y -= 256;
         
         playButton.screenCenter();
         add(playButton);
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
