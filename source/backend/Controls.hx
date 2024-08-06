package backend;

import flixel.input.gamepad.FlxGamepadButton;
import flixel.input.gamepad.FlxGamepadInputID;
import flixel.input.gamepad.mappings.FlxGamepadMapping;
import flixel.input.keyboard.FlxKey;

class Controls
{
	//Keeping same use cases on stuff for it to be easier to understand/use
	//I'd have removed it but this makes it a lot less annoying to use in my opinion

	//You do NOT have to create these variables/getters for adding new keys,
	//but you will instead have to use:
	//   controls.justPressed("ui_up")   instead of   controls.UI_UP

	//Dumb but easily usable code, or Smart but complicated? Your choice.
	//Also idk how to use macros they're weird as fuck lol

	// Pressed buttons (directions)
	public var UI_UP_P(get, never):Bool;
	public var UI_DOWN_P(get, never):Bool;
	public var UI_LEFT_P(get, never):Bool;
	public var UI_RIGHT_P(get, never):Bool;
	public var NOTE_UP_P(get, never):Bool;
	public var NOTE_DOWN_P(get, never):Bool;
	public var NOTE_LEFT_P(get, never):Bool;
	public var NOTE_RIGHT_P(get, never):Bool;
	private function get_UI_UP_P() return justPressed('ui_up');
	private function get_UI_DOWN_P() return justPressed('ui_down');
	private function get_UI_LEFT_P() return justPressed('ui_left');
	private function get_UI_RIGHT_P() return justPressed('ui_right');
	private function get_NOTE_UP_P() return justPressed('note_up');
	private function get_NOTE_DOWN_P() return justPressed('note_down');
	private function get_NOTE_LEFT_P() return justPressed('note_left');
	private function get_NOTE_RIGHT_P() return justPressed('note_right');

	// Held buttons (directions)
	public var UI_UP(get, never):Bool;
	public var UI_DOWN(get, never):Bool;
	public var UI_LEFT(get, never):Bool;
	public var UI_RIGHT(get, never):Bool;
	public var NOTE_UP(get, never):Bool;
	public var NOTE_DOWN(get, never):Bool;
	public var NOTE_LEFT(get, never):Bool;
	public var NOTE_RIGHT(get, never):Bool;
	private function get_UI_UP() return pressed('ui_up');
	private function get_UI_DOWN() return pressed('ui_down');
	private function get_UI_LEFT() return pressed('ui_left');
	private function get_UI_RIGHT() return pressed('ui_right');
	private function get_NOTE_UP() return pressed('note_up');
	private function get_NOTE_DOWN() return pressed('note_down');
	private function get_NOTE_LEFT() return pressed('note_left');
	private function get_NOTE_RIGHT() return pressed('note_right');

	// Released buttons (directions)
	public var UI_UP_R(get, never):Bool;
	public var UI_DOWN_R(get, never):Bool;
	public var UI_LEFT_R(get, never):Bool;
	public var UI_RIGHT_R(get, never):Bool;
	public var NOTE_UP_R(get, never):Bool;
	public var NOTE_DOWN_R(get, never):Bool;
	public var NOTE_LEFT_R(get, never):Bool;
	public var NOTE_RIGHT_R(get, never):Bool;
	private function get_UI_UP_R() return justReleased('ui_up');
	private function get_UI_DOWN_R() return justReleased('ui_down');
	private function get_UI_LEFT_R() return justReleased('ui_left');
	private function get_UI_RIGHT_R() return justReleased('ui_right');
	private function get_NOTE_UP_R() return justReleased('note_up');
	private function get_NOTE_DOWN_R() return justReleased('note_down');
	private function get_NOTE_LEFT_R() return justReleased('note_left');
	private function get_NOTE_RIGHT_R() return justReleased('note_right');


	// Pressed buttons (others)
	public var ACCEPT(get, never):Bool;
	public var BACK(get, never):Bool;
	public var PAUSE(get, never):Bool;
	public var RESET(get, never):Bool;
	private function get_ACCEPT() return justPressed('accept');
	private function get_BACK() return justPressed('back');
	private function get_PAUSE() return justPressed('pause');
	private function get_RESET() return justPressed('reset');

	//Gamepad & Keyboard stuff
	public var keyboardBinds:Map<String, Array<FlxKey>>;
	public var gamepadBinds:Map<String, Array<FlxGamepadInputID>>;

	//Stuff for mobile probably
	public var isInSubstate:Bool = false; // don't worry about this it becomes true and false on it's own in MusicBeatSubstate
	public var requested(get, default):Dynamic; // is set to MusicBeatState or MusicBeatSubstate when the constructor is called
	public function justPressed(key:String)
	{
		var result:Bool = (FlxG.keys.anyJustPressed(keyboardBinds[key]) == true);
		if(result) controllerMode = false;

		return result || _myGamepadJustPressed(gamepadBinds[key]) == true #if android || virtualPadButtonJustPressed(key) == true #end;
	}

	public function pressed(key:String)
	{
		var result:Bool = (FlxG.keys.anyPressed(keyboardBinds[key]) == true);
		if(result) controllerMode = false;

		return result || _myGamepadPressed(gamepadBinds[key]) == true #if android || virtualPadButtonPressed(key) == true #end;
	}

	public function justReleased(key:String)
	{
		var result:Bool = (FlxG.keys.anyJustReleased(keyboardBinds[key]) == true);
		if(result) controllerMode = false;

		return result || _myGamepadJustReleased(gamepadBinds[key]) == true #if android || virtualPadButtonJustReleased(key) == true #end;
	}

	#if android
	public var vpad:FlxVirtualPad;
	public function virtualPadButtonPressed(key:String):Bool {
		if (vpad != null && requested.vpad != null) {
			switch (key) {
				case 'ui_up': return vpad.buttonUp.pressed;
				case 'ui_down': return vpad.buttonDown.pressed;
				case 'ui_left': return vpad.buttonLeft.pressed;
				case 'ui_right': return vpad.buttonRight.pressed;
				case 'accept': return vpad.buttonA.pressed;
				case 'back': return vpad.buttonB.pressed;
			}
			if (requested.vpad.anyPressed(keys) == true)
			{
				controllerMode = true; // !!DO NOT DISABLE THIS IF YOU DONT WANT TO KILL THE INPUT FOR MOBILE!!
				return true;
			}
		}
		return false;
	}

	public function virtualPadButtonJustPressed(key:String):Bool {
		if (vpad != null && requested.vpad != null) {
			switch (key) {
				case 'ui_up': return vpad.buttonUp.justPressed;
				case 'ui_down': return vpad.buttonDown.justPressed;
				case 'ui_left': return vpad.buttonLeft.justPressed;
				case 'ui_right': return vpad.buttonRight.justPressed;
				case 'accept': return vpad.buttonA.justPressed;
				case 'back': return vpad.buttonB.justPressed;
			}
			if (requested.vpad.anyJustPressed(keys) == true)
			{
				controllerMode = true; // !!DO NOT DISABLE THIS IF YOU DONT WANT TO KILL THE INPUT FOR MOBILE!!
				return true;
			}
		}
		return false;
	}

	public function virtualPadButtonJustReleased(key:String):Bool {
		if (vpad != null && requested.vpad != null) {
			switch (key) {
				case 'ui_up': return vpad.buttonUp.justReleased;
				case 'ui_down': return vpad.buttonDown.justReleased;
				case 'ui_left': return vpad.buttonLeft.justReleased;
				case 'ui_right': return vpad.buttonRight.justReleased;
				case 'accept': return vpad.buttonA.justReleased;
				case 'back': return vpad.buttonB.justReleased;
			}
			if (requested.vpad.anyJustReleased(keys) == true)
			{
				controllerMode = true; // Do I repeat myself here
				return true;
			}
		}
		return false;
	}
	#end

	public var controllerMode:Bool = false;
	private function _myGamepadJustPressed(keys:Array<FlxGamepadInputID>):Bool
	{
		if(keys != null)
		{
			for (key in keys)
			{
				if (FlxG.gamepads.anyJustPressed(key) == true)
				{
					controllerMode = true;
					return true;
				}
			}
		}
		return false;
	}
	private function _myGamepadPressed(keys:Array<FlxGamepadInputID>):Bool
	{
		if(keys != null)
		{
			for (key in keys)
			{
				if (FlxG.gamepads.anyPressed(key) == true)
				{
					controllerMode = true;
					return true;
				}
			}
		}
		return false;
	}
	private function _myGamepadJustReleased(keys:Array<FlxGamepadInputID>):Bool
	{
		if(keys != null)
		{
			for (key in keys)
			{
				if (FlxG.gamepads.anyJustReleased(key) == true)
				{
					controllerMode = true;
					return true;
				}
			}
		}
		return false;
	}
	
	@:noCompletion
	private function get_requested():Dynamic
	{
		if (isInSubstate)
			return MusicBeatSubstate.instance;
		else
			return MusicBeatState.instance;
	}

	// IGNORE THESE
	public static var instance:Controls;
	public function new()
	{
		keyboardBinds = ClientPrefs.keyBinds;
		gamepadBinds = ClientPrefs.gamepadBinds;
	}
}
