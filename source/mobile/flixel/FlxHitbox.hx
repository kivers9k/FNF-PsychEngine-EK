package mobile.flixel;

import flixel.util.FlxGradient;
import flixel.group.FlxSpriteGroup;
import flixel.util.FlxDestroyUtil;
import flixel.ui.FlxButton;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxColor;
import openfl.display.BitmapData;
import openfl.display.Shape;
import backend.ExtraKeysHandler;

using StringTools;

class FlxHitbox extends FlxSpriteGroup {
	public var hitbox:FlxSpriteGroup;
	public var array:Array<FlxButton> = [];

	public function new(?type:Int = 3) {
		super();
		hitbox = new FlxSpriteGroup();
		
		var keyCount:Int = type + 1;
		var hitboxWidth:Int = Math.floor(FlxG.width / keyCount);
		for (i in 0 ... keyCount) {
			hitbox.add(add(array[i] = createhitbox(hitboxWidth * i, 0, hitboxWidth, FlxG.height, ExtraKeysHandler.instance.data.hitboxColor[type][i])));
		}
	}

	public function createhitbox(x:Float = 0, y:Float = 0, width:Int, height:Int, color:String) {
		var button:FlxButton = new FlxButton(x, y);
		button.loadGraphic(createHintGraphic(width, height));
		button.updateHitbox();
		button.alpha = 0;
		if (!color.startsWith('0x')) button.color = FlxColor.fromString('0x' + color);

		button.onDown.callback = function() button.alpha = ClientPrefs.data.controlsAlpha;
		button.onUp.callback = function() button.alpha = 0;
		button.onOut.callback = function() button.alpha = 0;

		return button;
	}

	function createHintGraphic(Width:Int, Height:Int):BitmapData
	{
		var guh = ClientPrefs.data.controlsAlpha;
		if (guh >= 0.9)
			guh = ClientPrefs.data.controlsAlpha - 0.07;

		var shape:Shape = new Shape();
		shape.graphics.beginGradientFill(RADIAL, [0xFFFFFF, FlxColor.TRANSPARENT], [guh, 0], [0, 255], null, null, null, 0.5);
		shape.graphics.drawRect(3, 3, Width - 6, Height - 6);
		shape.graphics.endFill();

		if (!ClientPrefs.data.hideHitboxHints) {
			shape.graphics.beginFill(0xFFFFFF);
			shape.graphics.lineStyle(3, 0xFFFFFF, 1);
			shape.graphics.drawRect(0, 0, Width, Height);
			shape.graphics.lineStyle(0, 0, 0);
			shape.graphics.drawRect(3, 3, Width - 6, Height - 6);
			shape.graphics.endFill();
		}

		var bitmap:BitmapData = new BitmapData(Width, Height, true, 0);
		bitmap.draw(shape);

		return bitmap;
	}

	override public function destroy():Void {
		super.destroy();
		hitbox = FlxDestroyUtil.destroy(hitbox);
		for (hbox in array) {
			hbox = null;
		}
	}
}
