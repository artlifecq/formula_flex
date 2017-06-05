package com.rpgGame.app.manager
{
	import com.rpgGame.app.sender.DungeonSender;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.coreData.enum.AlertClickTypeEnum;
	import com.rpgGame.coreData.info.alert.AlertSetInfo;
	import com.rpgGame.coreData.lang.LangAlertInfo;

	/**
	 *付费管理 
	 * @author dik
	 * 
	 */
	public class PayManager
	{
		private static var alertOk:AlertSetInfo;
		public function PayManager()
		{
		}
		
		/**
		 *提示元宝不足 
		 * 
		 */
		public static function alertGoldLack():void
		{
			alertOk=new AlertSetInfo(LangAlertInfo.LUNJIAN_FIGHT_MIN);
			GameAlert.showAlert(alertOk,onAlert);
		}
		
		private static function onAlert(gameAlert:GameAlert):void
		{
			switch(gameAlert.clickType)
			{
				case AlertClickTypeEnum.TYPE_SURE:
					break;
			}
		}
	}
}