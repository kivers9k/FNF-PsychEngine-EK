package mobile.flixel;

import flixel.util.FlxGradient;
import flixel.group.FlxSpriteGroup;
import flixel.util.FlxDestroyUtil;
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
		hint = new FlxSpriteGroup();
		
		var keyCount:Int = type + 1;
		var hitboxWidth:Int = Math.floor(FlxG.width / keyCount);
		for (i in 0 ... keyCount) {
			hitbox.add(add(array[i] = createhitbox(hitboxWidth * i, 0, hitboxWidth, FlxG.height, hitboxColor[keyCount][i])));
		}
	}

	public function createhitbox(x:Float = 0, y:Float = 0, width:Int, height:Int, color:Int) {

		var button:FlxButton = new FlxButton(x, y);
		button.loadGraphic(createHintGraphic(Width, Height));
		button.color = color;
		button.updateHitbox();
		button.alpha = 0;

		button.onOut.callback = function() button.alpha = 0;
		button.onUp.callback = function() button.alpha = 0;
		button.onDown.callback = function() button.alpha = 0.7;
		
		return button;
	}


	override public function destroy():Void {
		super.destroy();
		for (hbox in array) {
			hbox = null;
		}
	}
	function createHintGraphic(Width:Int, Height:Int):BitmapData
	{
		var guh = ClientPrefs.data.controlsAlpha;
		if (guh >= 0.9)
			guh = ClientPrefs.data.controlsAlpha - 0.07;
		var shape:Shape = new Shape();
		shape.graphics.beginFill(0xFFFFFF);
		shape.graphics.lineStyle(3, 0xFFFFFF, 1);
		shape.graphics.drawRect(0, 0, Width, Height);
		shape.graphics.lineStyle(0, 0, 0);
		shape.graphics.drawRect(3, 3, Width - 6, Height - 6);
		shape.graphics.endFill();
		shape.graphics.beginGradientFill(RADIAL, [0xFFFFFF, FlxColor.TRANSPARENT], [guh, 0], [0, 255], null, null, null, 0.5);
		shape.graphics.drawRect(3, 3, Width - 6, Height - 6);
		shape.graphics.endFill();
		var bitmap:BitmapData = new BitmapData(Width, Height, true, 0);
		bitmap.draw(shape);
		return bitmap;
	}
}
