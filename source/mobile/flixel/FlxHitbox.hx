package mobile.flixel;

import flixel.util.FlxGradient;
import flixel.group.FlxSpriteGroup;
import flixel.ui.FlxButton;
import flixel.FlxSprite;
import flixel.FlxG;

class FlxHitbox extends FlxSpriteGroup {
	public var hitbox:FlxSpriteGroup;
	public var array:Array<FlxButton> = [];

	var hitboxColor:Map<Int, Array<Int>> = [
		1 => [0xffFFFFFF],
		2 => [0xffE390E6, 0xffFF0000],
		3 => [0xffE390E6, 0xffFFFFFF, 0xffFF0000],
		4 => [0xffE390E6, 0xff00EDFF, 0xff00FF00, 0xffFF0000],
		5 => [0xffE390E6, 0xff00EDFF, 0xffFFFFFF, 0xff00FF00, 0xffFF0000],
		6 => [0xffE390E6, 0xff00FF00, 0xffFF0000, 0xffFFFF00, 0xff00EDFF, 0xff0000FF],
		7 => [0xffE390E6, 0xff00FF00, 0xffFF0000, 0xffFFFFFF, 0xffFFFF00, 0xff00EDFF, 0xff0000FF],
		8 => [0xffE390E6, 0xff00EDFF, 0xff00FF00, 0xffFF0000, 0xffFFFF00, 0xffBB00FF, 0xffFF0000, 0xff0000FF],
		9 => [0xffE390E6, 0xff00EDFF, 0xff00FF00, 0xffFF0000, 0xffFFFFFF, 0xffFFFF00, 0xffBB00FF, 0xffFF0000, 0xff0000FF],
 	];

	public function new(?type:Int = 3) {
		super();
		hitbox = new FlxSpriteGroup();
		
		var keyCount:Int = type + 1;
		var hitboxWidth:Int = Math.floor(FlxG.width / keyCount);
		for (i in 0 ... keyCount) {
			hitbox.add(add(array[i] = createhitbox(hitboxWidth * i, 0, hitboxWidth, FlxG.height, hitboxColor[keyCount][i])));
		}
	}

	public function createhitbox(x:Float = 0, y:Float = 0, width:Int, height:Int, color:Int) {
		var hitboxSpr:FlxSprite = FlxGradient.createGradientFlxSprite(width, height, [0x0, color]);

		var button:FlxButton = new FlxButton(x, y);
		button.loadGraphic(hitboxSpr.pixels);
		button.updateHitbox();
		button.alpha = 0;

		button.onOut.callback = function() button.alpha = 0;
		button.onUp.callback = function() button.alpha = 0;
		button.onDown.callback = function() button.alpha = 0.5;
		
		return button;
	}

	override public function destroy():Void {
		super.destroy();
		for (hbox in array) {
			hbox = null;
		}
	}
}