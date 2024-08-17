package mobile.flixel;

import flixel.FlxG;
import flixel.graphics.frames.FlxTileFrames;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxPoint;
import flixel.util.FlxDestroyUtil;
import flixel.ui.FlxButton;
import flixel.graphics.frames.FlxAtlasFrames;

class FlxVirtualPad extends FlxSpriteGroup {
	//Actions
	public var buttonA:FlxButton;
	public var buttonB:FlxButton;
	public var buttonC:FlxButton;
	public var buttonD:FlxButton;
	public var buttonE:FlxButton;
	public var buttonF:FlxButton;
	public var buttonG:FlxButton;
	public var buttonS:FlxButton;
	public var buttonV:FlxButton;
	public var buttonX:FlxButton;
	public var buttonY:FlxButton;
	public var buttonZ:FlxButton;

	//DPad
	public var buttonLeft:FlxButton;
	public var buttonUp:FlxButton;
	public var buttonRight:FlxButton;
	public var buttonDown:FlxButton;
	//I just realised we are gonna need more than one set for this one
	public var buttonLeft2:FlxButton;
	public var buttonUp2:FlxButton;
	public var buttonRight2:FlxButton;
	public var buttonDown2:FlxButton;

	public var dPad:FlxSpriteGroup;
	public var actions:FlxSpriteGroup;
	
	public function new(?DPad:FlxDPadMode, ?Action:FlxActionMode) {
		super();

		dPad = new FlxSpriteGroup();
		dPad.scrollFactor.set();
		
		actions = new FlxSpriteGroup();
		actions.scrollFactor.set();

		buttonA = new FlxButton(0, 0);
		buttonB = new FlxButton(0, 0);
		buttonC = new FlxButton(0, 0);
		buttonD = new FlxButton(0, 0);
		buttonE = new FlxButton(0, 0);
		buttonV = new FlxButton(0, 0);
		buttonX = new FlxButton(0, 0);
		buttonY = new FlxButton(0, 0);
		buttonZ = new FlxButton(0, 0);

		buttonLeft = new FlxButton(0, 0);
		buttonUp = new FlxButton(0, 0);
		buttonRight = new FlxButton(0, 0);
		buttonDown = new FlxButton(0, 0);
		buttonLeft2 = new FlxButton(0, 0);
		buttonUp2 = new FlxButton(0, 0);
		buttonRight2 = new FlxButton(0, 0);
		buttonDown2 = new FlxButton(0, 0);

		switch (DPad) {
			case UP_DOWN:
				dPad.add(add(buttonUp = createButton(0, FlxG.height - 255, 132, 127, "up", 0x00FF00)));
				dPad.add(add(buttonDown = createButton(0, FlxG.height - 135, 132, 127, "down", 0x00FFFF)));
			case LEFT_RIGHT:
				dPad.add(add(buttonLeft = createButton(0, FlxG.height - 135, 132, 127, "left", 0xFF00FF)));
				dPad.add(add(buttonRight = createButton(127, FlxG.height - 135, 132, 127, "right", 0xFF0000)));
			case UP_LEFT_RIGHT:
				dPad.add(add(buttonUp = createButton(105, FlxG.height - 243, 132, 127, "up", 0x00FF00)));
				dPad.add(add(buttonLeft = createButton(0, FlxG.height - 135, 132, 127, "left", 0xFF00FF)));
				dPad.add(add(buttonRight = createButton(207, FlxG.height - 135, 132, 127, "right", 0xFF0000)));
			case FULL:
				dPad.add(add(buttonUp = createButton(105, FlxG.height - 345, 132, 127, "up", 0x00FF00)));
				dPad.add(add(buttonLeft = createButton(0, FlxG.height - 243, 132, 127, "left", 0xFF00FF)));
				dPad.add(add(buttonRight = createButton(207, FlxG.height - 243, 132, 127, "right", 0xFF0000)));
				dPad.add(add(buttonDown = createButton(105, FlxG.height - 135, 132, 127, "down", 0x00FFFF)));
			case NOTE_SPLASH_DEBUG:
				dPad.add(add(buttonUp = createButton(0, 125, 132, 127, "up", 0x00FF00)));
				dPad.add(add(buttonLeft = createButton(0, 0, 132, 127, "left", 0xFF00FF)));
				dPad.add(add(buttonRight = createButton(127, 0, 132, 127, "right", 0xFF0000)));
				dPad.add(add(buttonDown = createButton(127, 125, 132, 127, "down", 0x00FFFF)));
				dPad.add(add(buttonUp2 = createButton(127, 393, 132, 127, "up", 0x00FF00)));
				dPad.add(add(buttonLeft2 = createButton(0, 393, 132, 127, "left", 0xFF00FF)));
				dPad.add(add(buttonRight2 = createButton(1145, 393, 132, 127, "right", 0xFF0000)));
				dPad.add(add(buttonDown2 = createButton(1015, 393, 132, 127, "down", 0x00FFFF)));
			case DIALOGUE_PORTRAIT:
				dPad.add(add(buttonUp = createButton(105, FlxG.height - 345, 132, 127, "up", 0x00FF00)));
				dPad.add(add(buttonLeft = createButton(0, FlxG.height - 243, 132, 127, "left", 0xFF00FF)));
				dPad.add(add(buttonRight = createButton(207, FlxG.height - 243, 132, 127, "right", 0xFF0000)));
				dPad.add(add(buttonDown = createButton(105, FlxG.height - 135, 132, 127, "down", 0x00FFFF)));
				dPad.add(add(buttonUp2 = createButton(105, 0, 132, 127, "up", 0x00FF00)));
				dPad.add(add(buttonLeft2 = createButton(0, 82, 132, 127, "left", 0xFF00FF)));
				dPad.add(add(buttonRight2 = createButton(207, 82, 132, 127, "right", 0xFF0000)));
				dPad.add(add(buttonDown2 = createButton(105, 190, 132, 127, "down", 0x00FFFF)));
			case NONE:
				// do nothing
		}

		switch (Action) {
			case A:
				dPad.add(add(buttonA = createButton(FlxG.width - 132, FlxG.height - 135, 132, 127, "a", 0xFF0000)));
			case B:
				dPad.add(add(buttonB = createButton(FlxG.width - 132, FlxG.height - 135, 132, 127, "b", 0xFFCB00)));
			case D:
				dPad.add(add(buttonD = createButton(FlxG.width - 132, FlxG.height - 135, 132, 127, "d", 0xFFCB00)));
			case A_B:
				dPad.add(add(buttonB = createButton(FlxG.width - 258, FlxG.height - 135, 132, 127, "b", 0xFFCB00)));
				dPad.add(add(buttonA = createButton(FlxG.width - 132, FlxG.height - 135, 132, 127, "a", 0xFF0000)));
			case B_X:
				dPad.add(add(buttonB = createButton(FlxG.width - 258, FlxG.height - 135, 132, 127, "b", 0xFFCB00)));
				dPad.add(add(buttonX = createButton(FlxG.width - 132, FlxG.height - 135, 132, 127, "x", 0xFF0000)));
			case A_B_C:
				dPad.add(add(buttonC = createButton(FlxG.width - 384, FlxG.height - 135, 132, 127, "c", 0x44FF00)));
				dPad.add(add(buttonB = createButton(FlxG.width - 258, FlxG.height - 135, 132, 127, "b", 0xFFCB00)));
				dPad.add(add(buttonA = createButton(FlxG.width - 132, FlxG.height - 135, 132, 127, "a", 0xFF0000)));
			case A_B_X:
				dPad.add(add(buttonX = createButton(FlxG.width - 384, FlxG.height - 135, 132, 127, "x", 0x44FF00)));
				dPad.add(add(buttonB = createButton(FlxG.width - 258, FlxG.height - 135, 132, 127, "b", 0xFFCB00)));
				dPad.add(add(buttonA = createButton(FlxG.width - 132, FlxG.height - 135, 132, 127, "a", 0xFF0000)));
			case A_B_E:
				dPad.add(add(buttonE = createButton(FlxG.width - 384, FlxG.height - 135, 132, 127, "e", 0x44FF00)));
				dPad.add(add(buttonB = createButton(FlxG.width - 258, FlxG.height - 135, 132, 127, "b", 0xFFCB00)));
				dPad.add(add(buttonA = createButton(FlxG.width - 132, FlxG.height - 135, 132, 127, "a", 0xFF0000)));
			case A_B_X_Y:
				dPad.add(add(buttonX = createButton(FlxG.width - 510, FlxG.height - 135, 132, 127, "x", 0x99062D)));
				dPad.add(add(buttonB = createButton(FlxG.width - 258, FlxG.height - 135, 132, 127, "b", 0xFFCB00)));
				dPad.add(add(buttonY = createButton(FlxG.width - 384, FlxG.height - 135, 132, 127, "y", 0x4A35B9)));
				dPad.add(add(buttonA = createButton(FlxG.width - 132, FlxG.height - 135, 132, 127, "a", 0xFF0000)));
			case A_B_C_X:
				dPad.add(add(buttonC = createButton(FlxG.width - 510, FlxG.height - 135, 132, 127, "c", 0x44FF00)));
				dPad.add(add(buttonB = createButton(FlxG.width - 258, FlxG.height - 135, 132, 127, "b", 0xFFCB00)));
				dPad.add(add(buttonX = createButton(FlxG.width - 384, FlxG.height - 135, 132, 127, "x", 0x99062D)));
				dPad.add(add(buttonA = createButton(FlxG.width - 132, FlxG.height - 135, 132, 127, "a", 0xFF0000)));
			case A_B_C_X_Y:
				dPad.add(add(buttonC = createButton(FlxG.width - 384, FlxG.height - 135, 132, 127, "c", 0x44FF00)));
				dPad.add(add(buttonX = createButton(FlxG.width - 258, FlxG.height - 255, 132, 127, "x", 0x99062D)));
				dPad.add(add(buttonB = createButton(FlxG.width - 258, FlxG.height - 135, 132, 127, "b", 0xFFCB00)));
				dPad.add(add(buttonY = createButton(FlxG.width - 132, FlxG.height - 255, 132, 127, "y", 0x4A35B9)));
				dPad.add(add(buttonA = createButton(FlxG.width - 132, FlxG.height - 135, 132, 127, "a", 0xFF0000)));
			case A_B_C_X_Y_Z:
				dPad.add(add(buttonX = createButton(FlxG.width - 384, FlxG.height - 255, 132, 127, "x", 0x99062D)));
				dPad.add(add(buttonC = createButton(FlxG.width - 384, FlxG.height - 135, 132, 127, "c", 0x44FF00)));
				dPad.add(add(buttonY = createButton(FlxG.width - 258, FlxG.height - 255, 132, 127, "y", 0x4A35B9)));
				dPad.add(add(buttonB = createButton(FlxG.width - 258, FlxG.height - 135, 132, 127, "b", 0xFFCB00)));
				dPad.add(add(buttonZ = createButton(FlxG.width - 132, FlxG.height - 255, 132, 127, "z", 0xCCB98E)));
				dPad.add(add(buttonA = createButton(FlxG.width - 132, FlxG.height - 135, 132, 127, "a", 0xFF0000)));
			case FULL:
				dPad.add(add(buttonV = createButton(FlxG.width - 510, FlxG.height - 255, 132, 127, "v", 0x49A9B2)));
				dPad.add(add(buttonD = createButton(FlxG.width - 510, FlxG.height - 135, 132, 127, "d", 0x0078FF)));
				dPad.add(add(buttonX = createButton(FlxG.width - 384, FlxG.height - 255, 132, 127, "x", 0x99062D)));
				dPad.add(add(buttonC = createButton(FlxG.width - 384, FlxG.height - 135, 132, 127, "c", 0x44FF00)));
				dPad.add(add(buttonY = createButton(FlxG.width - 258, FlxG.height - 255, 132, 127, "y", 0x4A35B9)));
				dPad.add(add(buttonB = createButton(FlxG.width - 258, FlxG.height - 135, 132, 127, "b", 0xFFCB00)));
				dPad.add(add(buttonZ = createButton(FlxG.width - 132, FlxG.height - 255, 132, 127, "z", 0xCCB98E)));
				dPad.add(add(buttonA = createButton(FlxG.width - 132, FlxG.height - 135, 132, 127, "a", 0xFF0000)));
			case CHART_EDITOR:
				actions.add(add(buttonZ = createButton(FlxG.width - 384, FlxG.height - 255, 132, 127, "z", 0xCCB98E)));
				actions.add(add(buttonA = createButton(FlxG.width - 384, FlxG.height - 135, 132, 127, "a", 0xFF0000)));
				actions.add(add(buttonC = createButton(FlxG.width - 510, FlxG.height - 255, 132, 127, "c", 0x44FF00)));
				actions.add(add(buttonB = createButton(FlxG.width - 510, FlxG.height - 135, 132, 127, "b", 0xFFCB00)));
				actions.add(add(buttonX = createButton(FlxG.width - 132, FlxG.height - 375, 132, 127, "x", 0x99062D)));

				dPad.add(add(buttonUp = createButton(FlxG.width - 258, FlxG.height - 255, 132, 127, "up", 0x00FF00)));
				dPad.add(add(buttonLeft = createButton(FlxG.width - 132, FlxG.height - 255, 132, 127, "left", 0xFF00FF)));
				dPad.add(add(buttonRight = createButton(FlxG.width - 127, FlxG.height - 135, 132, 127, "right", 0xFF0000)));
				dPad.add(add(buttonDown = createButton(FlxG.width - 258, FlxG.height - 135, 132, 127, "down", 0x00FFFF)));
			case NOTE_SPLASH_DEBUG:
				dPad.add(add(buttonB = createButton(FlxG.width - 258, FlxG.height - 135, 132, 127, 'b', 0xFFCB00)));
				dPad.add(add(buttonE = createButton(FlxG.width - 132, 0, 132, 127, 'e', 0xFF7D00)));
				dPad.add(add(buttonX = createButton(FlxG.width - 258, 0, 132, 127, 'x', 0x99062D)));
				dPad.add(add(buttonY = createButton(FlxG.width - 132, 250, 132, 127, 'y', 0x4A35B9)));
				dPad.add(add(buttonZ = createButton(FlxG.width - 258, 250, 132, 127, 'z', 0xCCB98E)));
				dPad.add(add(buttonA = createButton(FlxG.width - 132, FlxG.height - 135, 132, 127, 'a', 0xFF0000)));
				dPad.add(add(buttonC = createButton(FlxG.width - 132, 125, 132, 127, 'c', 0x44FF00)));
				dPad.add(add(buttonV = createButton(FlxG.width - 258, 125, 132, 127, 'v', 0x49A9B2)));
			case DIALOGUE_PORTRAIT:
				dPad.add(add(buttonX = createButton(FlxG.width - 384, 0, 132, 127, "x", 0x99062D)));
				dPad.add(add(buttonC = createButton(FlxG.width - 384, 125, 132, 127, "c", 0x44FF00)));
				dPad.add(add(buttonY = createButton(FlxG.width - 258, 0, 132, 127, "y", 0x4A35B9)));
				dPad.add(add(buttonB = createButton(FlxG.width - 258, 125, 132, 127, "b", 0xFFCB00)));
				dPad.add(add(buttonZ = createButton(FlxG.width - 132, 0, 132, 127, "z", 0xCCB98E)));
				dPad.add(add(buttonA = createButton(FlxG.width - 132, 125, 132, 127, "a", 0xFF0000)));
			case CHARACTER_EDITOR:
				dPad.add(add(buttonV = createButton(FlxG.width - 510, FlxG.height - 255, 132, 127, 'v', 0x49A9B2)));
				dPad.add(add(buttonD = createButton(FlxG.width - 510, FlxG.height - 135, 132, 127, 'd', 0x0078FF)));
				dPad.add(add(buttonX = createButton(FlxG.width - 384, FlxG.height - 255, 132, 127, 'x', 0x99062D)));
				dPad.add(add(buttonC = createButton(FlxG.width - 384, FlxG.height - 135, 132, 127, 'c', 0x44FF00)));
				dPad.add(add(buttonS = createButton(FlxG.width - 636, FlxG.height - 135, 132, 127, 's', 0xEA00FF)));
				dPad.add(add(buttonF = createButton(FlxG.width - 410, 0, 132, 127, 'f', 0xFF009D)));
				dPad.add(add(buttonY = createButton(FlxG.width - 258, FlxG.height - 255, 132, 127, 'y', 0x4A35B9)));
				dPad.add(add(buttonB = createButton(FlxG.width - 258, FlxG.height - 135, 132, 127, 'b', 0xFFCB00)));
				dPad.add(add(buttonZ = createButton(FlxG.width - 132, FlxG.height - 255, 132, 127, 'z', 0xCCB98E)));
				dPad.add(add(buttonA = createButton(FlxG.width - 132, FlxG.height - 135, 132, 127, 'a', 0xFF0000)));
			case NONE:
				// do nothing
		}
	}

	public function createButton(x:Float, y:Float, width:Int, height:Int, frames:String, Color:Int = 0xFFFFFF):FlxButton {
		var button = new FlxButton(x, y);
		button.frames = FlxTileFrames.fromFrame(getFrames().getByName(frames), FlxPoint.get(width, height));
		button.resetSizeFromFrame();
		button.solid = false;
		button.immovable = true;
		button.scrollFactor.set();
		button.color = Color;
		button.alpha = 0.7;
		button.antialiasing = true;

		return button;
	}

	public static function getFrames():FlxAtlasFrames {
		return Paths.getPackerAtlas('mobileControls/virtualpad');
	}

	override public function destroy():Void {
		super.destroy();

		dPad = FlxDestroyUtil.destroy(dPad);
		actions = FlxDestroyUtil.destroy(actions);

		dPad = null;
		actions = null;

		buttonA = null;
		buttonB = null;
		buttonC = null;
		buttonD = null;
		buttonE = null;
		buttonF = null;
		buttonG = null;
		buttonS = null;

		buttonV = null;
		buttonX = null;
		buttonY = null;
		buttonZ = null;

		buttonLeft = null;
		buttonUp = null;
		buttonDown = null;
		buttonRight = null;
		buttonLeft2 = null;
		buttonUp2 = null;
		buttonDown2 = null;
		buttonRight2 = null;
	}
}

enum FlxDPadMode {
	UP_DOWN;
	LEFT_RIGHT;
	UP_LEFT_RIGHT;
	FULL;
	NOTE_SPLASH_DEBUG;
	DIALOGUE_PORTRAIT;
	NONE;
}

enum FlxActionMode {
	A;
	B;
	D;
	A_B;
	B_X;
	A_B_C;
	A_B_X;
	A_B_E;
	A_B_X_Y;
	A_B_C_X;
	A_B_C_X_Y;
	A_B_C_X_Y_Z;
	FULL;
	CHART_EDITOR;
	NOTE_SPLASH_DEBUG;
	DIALOGUE_PORTRAIT;
	CHARACTER_EDITOR;
	NONE;
}
