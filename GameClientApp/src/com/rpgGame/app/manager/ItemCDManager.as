package com.rpgGame.app.manager
{
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.goods.ItemManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.core.view.uiComponent.face.cd.CDDataManager;
	import com.rpgGame.coreData.cfg.GCDCfgData;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.clientConfig.Q_item;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	import com.rpgGame.coreData.enum.CDTypeEnum;
	import com.rpgGame.coreData.enum.face.FaceTypeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;

	/**
	 * 物品cd管理器 
	 * @author yt
	 * 
	 */
	public class ItemCDManager
	{
		
		private static var _instance : ItemCDManager;
		
		public static function getInstance() : ItemCDManager
		{
			if (!_instance)
				_instance = new ItemCDManager();
			
			return _instance;
		}
		public function ItemCDManager()
		{
			
			
		}
		/**
		 * 添加物品CDbyId
		 */
		public function addItemCDTimeByid(itemid :int) : void
		{
			var itemData :Q_item=ItemConfig.getQItemByID(itemid);
			if(itemData!=null)
			{
				addItemCDTime(itemData);
			}
		}
		
		/**
		 * 添加物品CD
		 */
		public function addItemCDTime(itemData :Q_item) : void
		{
			if (itemData == null)
			{
				return;
			}
			var curGcd : int = GCDCfgData.getGcd(itemData.q_cooldown_level);
			var isGlobal : Boolean = curGcd > 0;
			if (isGlobal) //是否添加全局CD
			{
				//直接替换成当前物品的gcd为公共CD
				CDDataManager.playCD(getGlobalKey(itemData.q_cooldown_level), curGcd);
			}
			
			var cdTime : int = 0; //已经经过的时间
			var configCDTime : int = itemData.q_cooldown; //配置的CD时间
			CDDataManager.playCD(getItemKey(itemData.q_id), configCDTime, cdTime);
			
			if (!isGlobal)
				return;
			//如果是全局CD那么给影响的技能全部加上CD，如果它本身就有CD的话，留下CD长的那个    -----------------------
			var itemList : Array = BackPackManager.instance.getAllItem();
			if(itemList)
			{
				var len : int = itemList.length;
				var skillLastCd : int;
				var itemInfo:ClientItemInfo;
				for (var i : int = 0; i < len; i++)
				{
					itemInfo = itemList[i];
					if(itemInfo!=null)
					{
						skillLastCd = CDDataManager.getCdLostTm(getItemKey(itemInfo.qItem.q_id));
						if (skillLastCd < curGcd)
						{
							CDDataManager.playCD(getItemKey(itemInfo.qItem.q_id), curGcd, 0);
						}
					}
					
				}
			
			
			}
			
		}
		
		
		/**
		 * 得到CD的KEY
		 * @param spellType
		 */
		public function getItemKey(itemID : int) : String
		{
			return FaceTypeEnum.ITEM + "_" + itemID;
		}
		
		/**
		 * 得到公共CD的KEY
		 * @param spellType
		 */
		public function getGlobalKey(level : int) : String
		{
			return FaceTypeEnum.ITEM_PUBLIC + "_" + level;
		}
		
		
		/**
		 * 是否还有CD存在，包括公共CD。
		 */
		public function getSkillHasCDTime(itemData :Q_item) : Boolean
		{
			return getItemCDLastTime(itemData) > 0;
		}
		
		/**
		 * 获取CD剩余时间，包括检测公共CD剩余时间
		 */
		public function getItemCDLastTime(itemData :Q_item) : uint
		{
			var isGlobal : Boolean = getItemHasGlobal(itemData);
			if (isGlobal)
			{
				var lastTime : uint = Math.max(CDDataManager.getCdLostTm(getGlobalKey(itemData.q_cooldown_level)), CDDataManager.getCdLostTm(getItemKey(itemData.q_id)));
				return lastTime;
			}
			
			return CDDataManager.getCdLostTm(getItemKey(itemData.q_id));
		}
		/**
		 * 是否计算公共CD
		 */
		private function getItemHasGlobal(itemData :Q_item) : Boolean
		{
			if (itemData==null)
				return false;
			var curGcd : int = GCDCfgData.getGcd(itemData.q_cooldown_level);
			return curGcd > 0;
		}
	}
}