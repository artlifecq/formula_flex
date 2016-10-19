package com.rpgGame.coreData.enum
{
	/**
	 * alert框 不再提示 的类型常量 
	 * @author fly
	 * 
	 */	
	public class PromptSaveNameEnum
	{
		/** 用于测试当前登录有效的设置名称*/		
		public static const TEST_CURRENT_LIFE_SET:PromptSaveNameEnum = new PromptSaveNameEnum(PromptSaveType.THIS_LOGIN,"test_this_login" ,null);
		/** 用于测试存在so里的设置名称 */		
		public static const TEST_SO_SET:PromptSaveNameEnum = new PromptSaveNameEnum(PromptSaveType.SHARED_OBJECT,"test_so_Set",null);
		/**挂机时琴心升级不再提示*/
		public static const HOOK_ZITHER_HEART_UPGRADE:PromptSaveNameEnum = new PromptSaveNameEnum(PromptSaveType.THIS_LOGIN,"hook_zither_heart_upgrade",null);
		
		/** 挂机10秒没怪物， 提示换地方挂机不再提示*/
		public static const HOOK_NO_MONSTER_NOTE:PromptSaveNameEnum = new PromptSaveNameEnum(PromptSaveType.THIS_LOGIN,"hook_no_monster_note",null);
		
		public static const PHOENIX_ALERT_PANEL:PromptSaveNameEnum  = new PromptSaveNameEnum(PromptSaveType.THIS_LOGIN,"phoenix_alert_panel",null);
		
		/** 摇钱树一次摇钱提醒 */
		public static const GOLD_EXCHANGE_ONE_REQ_NO_PRO:PromptSaveNameEnum = new PromptSaveNameEnum(PromptSaveType.THIS_LOGIN,"gold_exchange_one_req_no_pro",null);
		/** 摇钱树十次摇钱提醒 */
		public static const GOLD_EXCHANGE_TEN_REQ_NO_PRO:PromptSaveNameEnum = new PromptSaveNameEnum(PromptSaveType.THIS_LOGIN,"gold_exchange_ten_req_no_pro",null);
		/** 腾翔卷轴消耗提醒 */
		public static const FLY_ITEM_REQ_NO_PRO:PromptSaveNameEnum = new PromptSaveNameEnum(PromptSaveType.THIS_LOGIN,"fly_item_req_no_pro",null);
		
		public static const GUO_YUN_ALERT:PromptSaveNameEnum = new PromptSaveNameEnum(PromptSaveType.THIS_LOGIN,"guo_yun_alert",null);
		/** 高品质物品售出 */
		public static const SHOP_SELL_ITEM_ALERT:PromptSaveNameEnum = new PromptSaveNameEnum(PromptSaveType.THIS_LOGIN,"shop_sell_item_alert",null);
		
		/**
		 * 不再提示的类型,是本次登录,还是永久, 详见PromptSaveType 
		 */		
		private var _saveType:int;	
		private var _saveName:String;
		
		public function PromptSaveNameEnum( type:int, typeName:String, simgle:Single )
		{
			_saveType = type;
			_saveName = typeName;
		}

		public function get saveType():int
		{
			return _saveType;
		}

		public function get saveName():String
		{
			return _saveName;
		}
	}
}
class Single{};