package mobile.options;

import options.BaseOptionsMenu;
import options.Option;

class MobileOptionsSubState extends BaseOptionsMenu
{
	var exControlTypes:Array<String> = ["NONE", "SINGLE", "DOUBLE"];

	public function new()
	{
		title = 'Mobile Options';
		rpcTitle = 'Mobile Options Menu'; // for Discord Rich Presence, fuck it

		#if mobile
		var option:Option = new Option('Allow Phone Screensaver', 'If checked, the phone will sleep after going inactive for few seconds.', 'screensaver', 'bool');
		option.onChange = () ->
		{
			lime.system.System.allowScreenTimeout = curOption.getValue();
		};
		addOption(option);
		#end

		var option:Option = new Option('Hide Hitbox Hints', 'If checked, makes the hitbox invisible.', 'hideHitboxHints', 'bool');
		addOption(option);

		var option:Option = new Option('Hitbox Position', 'If checked, the hitbox will be put at the bottom of the screen, otherwise will stay at the top.', 'hitbox2', 'bool');
		addOption(option);

		var option:Option = new Option('Dynamic Controls Color', 'If checked, the mobile controls color will be set to the notes color in your settings.\n(have effect during gameplay only)', 'dynamicColors', 'bool');
		addOption(option);

		super();
	}
}