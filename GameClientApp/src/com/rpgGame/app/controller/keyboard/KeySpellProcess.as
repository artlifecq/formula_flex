package com.rpgGame.app.controller.keyboard
{
	import com.rpgGame.app.manager.ShortcutsManger;
	import com.rpgGame.app.manager.TrusteeshipManager;
	import com.rpgGame.core.events.SpellEvent;
	import com.rpgGame.coreData.info.key.KeyInfo;
	
	import flash.ui.Keyboard;
	
	import org.client.mainCore.manager.EventManager;

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
			if (Keyboard.F1!=info.code) 
			{
				TrusteeshipManager.getInstance().stopFightTarget();//放技能就停止被动战斗
				
			}
			if(ShortcutsManger.getInstance().useShortcuts(int(funcID) - 1, true))
			{
				EventManager.dispatchEvent(SpellEvent.SPELL_KEY_RELEASE, int(funcID) - 1);
			}
			//使用这快捷栏上的技能或者是物品
			// funcID从1开如，快捷栏从0开如所以减1
			
		}
        
        public static function execUp(info : KeyInfo) : void
        {
            var dataID : uint = info.dataID;
            var funcID : String = info.funcS;
            
            //使用这快捷栏上的技能或者是物品
            // funcID从1开如，快捷栏从0开如所以减1
        }

		public function KeySpellProcess()
		{
		}
	}
}
