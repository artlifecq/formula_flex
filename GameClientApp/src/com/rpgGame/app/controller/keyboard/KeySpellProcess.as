package com.rpgGame.app.controller.keyboard
{
	import com.rpgGame.app.manager.ShortcutsManger;
	import com.rpgGame.coreData.info.key.KeyInfo;

	/**
	 *
	 * 键盘按键释放技能
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-11 下午5:22:16
	 *
	 */
	public class KeySpellProcess
	{
		public static function exec(info : KeyInfo) : void
		{
			var dataID : uint = info.dataID;
			var funcID : String = info.funcS;

			//使用这快捷栏上的技能或者是物品
			// funcID从1开如，快捷栏从0开如所以减1
			ShortcutsManger.getInstance().useShortcuts(int(funcID) - 1, true);
		}
        
        public static function execUp(info : KeyInfo) : void
        {
            var dataID : uint = info.dataID;
            var funcID : String = info.funcS;
            
            //使用这快捷栏上的技能或者是物品
            // funcID从1开如，快捷栏从0开如所以减1
            ShortcutsManger.getInstance().unUseShortcuts(int(funcID) - 1, true);
        }

		public function KeySpellProcess()
		{
		}
	}
}
