package com.rpgGame.app.manager.mount
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.coreData.cfg.AttValueConfig;
	import com.rpgGame.coreData.cfg.HorseConfigData;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.clientConfig.Q_att_values;
	import com.rpgGame.coreData.clientConfig.Q_horse;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	import com.rpgGame.netData.horse.bean.HorseDataInfo;
	
	import flash.utils.Dictionary;

	public class MountShowData
	{
		private var _haveChange:Boolean = true;

		public function get haveChange():Boolean
		{
			return _haveChange;
		}

		private var _horsedataInfo:HorseDataInfo;
		private var _lastLevel:int;
		private var _upLevelItem:ClientItemInfo;
		private var _currentProp:Vector.<Number>;
		private var _disProp:Vector.<Number>;
		private var _addProp:Vector.<Number>;
		private var _useItems:Dictionary = new Dictionary();
		private var _isMaxLevel:Boolean;
		public function get isMaxLevel():Boolean
		{
			return _isMaxLevel;
		}
		public function get upLevelItem():ClientItemInfo
		{
			return _upLevelItem;
		}
		
		public function get bagHaveItemCount():int
		{
			return BackPackManager.instance.getBagItemsCountById(_upLevelItem.cfgId);
		}
		
		public function get upLevelNeedItemCount():int
		{
			return _upLevelItem.itemInfo.num;
		}
		
		public function canUpLevel():Boolean
		{
			return upLevelNeedItemCount<=bagHaveItemCount
		}
		
		private var _rewardItems:Vector.<ClientItemInfo>;

		public function get rewardItems():Vector.<ClientItemInfo>
		{
			return _rewardItems;
		}
		
		public function get horsedataInfo():HorseDataInfo
		{
			return _horsedataInfo;
		}
		public function set horsedataInfo(info:HorseDataInfo):void
		{
			_horsedataInfo = info;
			if(_lastLevel== mountLevel)
				return ;
			var iteminfo:Object = JSONUtil.decode( housedata.q_need_items)[0];
			var itemModeId:int = iteminfo["mod"];
			if(ItemConfig.getQItemByID(itemModeId)!=null)
			{
				var item:ItemInfo = new ItemInfo();
				item.itemModelId = iteminfo["mod"];
				item.num = iteminfo["num"];
				item.isbind = iteminfo["bind"];
				_upLevelItem = ItemUtil.convertClientItemInfo(item);
			}
			
			_rewardItems = new Vector.<ClientItemInfo>();
			var itemInfos:Object = JSONUtil.decode( housedata.q_update_gift);
			for each(iteminfo in itemInfos)
			{
				itemModeId = iteminfo["mod"];
				if(ItemConfig.getQItemByID(itemModeId)==null)
					continue;
				item = new ItemInfo();
				item.itemModelId = iteminfo["mod"];
				item.num = iteminfo["num"];
				item.isbind = iteminfo["bind"];
				_rewardItems.push(ItemUtil.convertClientItemInfo(item));
			}
			//当前等级配置属性
			_currentProp = new Vector.<Number>(30,0);
			var type:int;
			var value:int;
			var currentatt:Q_att_values = AttValueConfig.getAttInfoById(int(housedata.q_attid));
			for(var i:int = 1;i<=15;i++)
			{
				type = currentatt["q_type"+i];
				if(type==0)
					continue;
				value = currentatt["q_value"+i];
				_currentProp[type] = value;
			}
			
			//差距
			currentatt = AttValueConfig.getAttInfoById(int(housedata.q_attid+1));
			if(currentatt!=null)
			{
				_disProp = new Vector.<Number>(30,0);
				for(i = 1;i<=15;i++)
				{
					type = currentatt["q_type"+i];
					if(type==0)
						continue;
					value = currentatt["q_value"+i];
					_disProp[type] = value-_currentProp[type];
				}
				_isMaxLevel = false;
			}else{
				_disProp = null;
				_isMaxLevel = true;
			}
			
			//资质丹加成属性
			if(_addProp ==null)
			{
				_addProp = new Vector.<Number>(30,0);
				var extraIteminfo:HorseExtraItemInfo = getOpenLevelBytype(506);
				currentatt = AttValueConfig.getAttInfoById(extraIteminfo.clientItemInfo.qItem.q_att_type);
				for(i = 1;i<=15;i++)
				{
					type = currentatt["q_type"+i];
					if(type==0)
						continue;
					value = currentatt["q_value"+i];
					_addProp[type] = value;
				}
			}
			_haveChange = true;
		}
		
		public function useExtraItem(num1:int,num2:int):void
		{
			_useItems[506] = num1;
			_useItems[507] = num1;
		}
		
		public function getUseExtralItem(type:int):int
		{
			if(type!=506||type!=507)
				return 0;
			return _useItems[type];
		}
		
		public function currentProp(helpProp:Vector.<Number>):Vector.<Number>
		{
			if(helpProp==null)
				helpProp = new Vector.<Number>(30,0);
			
			for(var i:int = 0;i<30;i++)
			{
				helpProp[i]=(_currentProp[i]+_addProp[i]*_useItems[506])*addExtraPercent;
			}
			return helpProp;
		}
		
		public function addProps(helpProp:Vector.<Number> = null):Vector.<Number>
		{
			if(_isMaxLevel)
				return null;
			helpProp = new Vector.<Number>(30,0);
			var percent:Number = percent;
			helpProp[CharAttributeType.WAI_GONG]=_disProp[CharAttributeType.WAI_GONG]*addExtraPercent;
			helpProp[CharAttributeType.NEI_GONG]=_disProp[CharAttributeType.NEI_GONG]*addExtraPercent;
			if(percent>=0.3)
				helpProp[CharAttributeType.DEFENSE_PER]=_disProp[CharAttributeType.DEFENSE_PER]*addExtraPercent;
			if(percent>=0.5)
				helpProp[CharAttributeType.MAX_HP]=_disProp[CharAttributeType.MAX_HP]*addExtraPercent;
			return helpProp;
		}
		private function get addExtraPercent():Number
		{
			return 1+_useItems[507]*0.01;
		}
		
		public function getOpenLevelBytype(type:int):HorseExtraItemInfo
		{
			return HorseExtraItemInfo.getinfobyId(type);
		}
		
		public function get isSelf():Boolean
		{
			return true;
		}
		
		public function get mountLevel():int
		{
			//测试使用
			if(_horsedataInfo==null)
				return 1;
			return _horsedataInfo.horseModelId;
		}
		
		public function get exp():int
		{
			//测试使用
			if(_horsedataInfo==null)
				return 1;
			return _horsedataInfo.exp;
		}
		public function get percent():Number
		{
			return this.exp/housedata.q_blessnum_limit;
		}
		
		public function get housedata():Q_horse
		{
			return HorseConfigData.getMountDataById(mountLevel);
		}
		
		private var _isAutoing:Boolean = false;
		
		public function get isAutoing():Boolean
		{
			return _isAutoing;
		}
		
		public function set isAutoing(value:Boolean):void
		{
			if(value&&!isSelf)
				return ;
			_isAutoing = value;
		}
		
		public function needClearExp():Boolean
		{
			return exp<=3;
		}
		public var autoBuyItem :Boolean = false;
	}
}