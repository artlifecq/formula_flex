package com.rpgGame.app.manager
{
	import com.gameClient.log.GameLog;
	import com.rpgGame.app.sender.HeroMiscSender;
	import com.rpgGame.core.events.SystemEvent;
	import com.rpgGame.coreData.enum.EnumCustomTagType;
	
	import org.client.mainCore.manager.EventManager;

	public class SystemSetManager
	{
		/**生命值**/
		public  static const SYSTEMSET_LIFE:int = 0;
		/**内力值**/
		public  static const SYSTEMSET_FORCE:int = 1;
		/**自动买药**/
		public  static const SYSTEMSET_AUOTBUYITEM:int = 2;
		/**自动使用背包物品**/
		public  static const SYSTEMSET_AUOTUSEITEM:int = 3;
		/**非和平式自动挂机时优先攻击玩家**/
		public  static const SYSTEMSET_AUOTATTACKPLAYER:int = 4;
		/**自动拾取物品**/
		public  static const SYSTEMSET_AUOT_GET_ITEM:int = 5;
		/**人物死亡使用药品复活**/
		public  static const SYSTEMSET_AUOT_USE_ITEM_ISDEAD:int = 6;
		/**音乐**/
		public  static const SYSTEMSET_SOUND:int = 7;
		/**音效**/
		public  static const SYSTEMSET_SOUNDEFFECT:int = 8;
		/**拒绝他人加好友**/
		public  static const SYSTEMSET_REFUSE_FRIENDS:int = 9;
		/**接受私聊**/
		public  static const SYSTEMSET_PRIVATE_CHAT:int = 10;
		/**拒绝其他人组队邀请**/
		public  static const SYSTEMSET_REFUSING_TEAM:int = 11;
		/**拒绝其他人帮会邀请**/
		public  static const SYSTEMSET_REFUSING_GANG:int = 12;
		/**自动优化机制**/
		public  static const SYSTEMSET_AUOT_OPTIMIZATION:int = 13;
		/**隐藏其他玩家**/
		public  static const SYSTEMSET_HIDE_PLAYERS:int = 14;
		/**隐藏同帮玩家**/
		public  static const SYSTEMSET_HIDE_GANG_PLAYERS:int = 15;
		/**隐藏怪物**/
		public  static const SYSTEMSET_HIDE_GANG_ENEMYS:int = 16;
		/**隐藏伤害数字**/
		public  static const SYSTEMSET_HIDE_DAMAGE_NUMBER:int = 17;
		/**隐藏其他玩家技能特效**/
		public  static const SYSTEMSET_HIDE_OTHER_SPELL_EFFECTS:int = 18;
		/**隐藏玩家技能特效**/
		public  static const SYSTEMSET_HIDE_SPELL_EFFECTS:int = 19;
		/**屏蔽场景特效**/
		public  static const SYSTEMSET_HIDE_EFFECTS:int = 20;
		/**隐藏阴影效果**/
		public  static const SYSTEMSET_HIDE_SHADOW_EFFECTS:int = 21;
		/**屏蔽天气特效**/
		public  static const SYSTEMSET_HIDE_WEATHER_EFFECTS:int = 22;
		/**屏蔽屏幕震动**/
		public  static const SYSTEMSET_HIDE_SCREEN_SHOCK:int = 23;
		/**屏蔽血量过低时的闪屏**/
		public  static const SYSTEMSET_HIDE_SWTSITL:int = 24;
		/**全选**/
		public  static const SYSTEMSET_AUOT_GET_ALL:int = 32;
		/**自动拾取金币**/
		public  static const SYSTEMSET_AUOT_GET_MONEY:int = 33;
		/**自动拾取药品**/
		public  static const SYSTEMSET_AUOT_GET_DRUGS:int = 34;
		/**自动拾取装备**/
		public  static const SYSTEMSET_AUOT_GET_EQUIPMENT:int = 35;
		/**自动拾取材料**/
		public  static const SYSTEMSET_AUOT_GET_MATERIAL:int = 36;
		/**自动拾取任务物品**/
		public  static const SYSTEMSET_AUOT_GET_TASKITEM:int = 37;
		/**自动拾取其他物品**/
		public  static const SYSTEMSET_AUOT_GET_OTHERITEM:int = 38;
		/**血量百分比**/
		public static const SYSTEMSET_HP_PERCENT:int = 101;
		/**内力百分比**/
		public static const SYSTEMSET_FORCE_PERCENT:int = 102;
		/**自动使用百分比**/
		public static const SYSTEMSET_USEITEM_PERCENT:int = 103;
		/**挂机范围**/
		public static const SYSTEMSET_HOOK_TYPE:int = 104;
		/**音乐**/
		public static const SYSTEMSET_SOUND_BG:int = 105;
		/**音效**/
		public static const SYSTEMSET_SOUND_EFFECT:int = 106;
		private static var _instance:SystemSetManager;
		
		public static function getinstance():SystemSetManager
		{
			if(_instance==null)
			{
				_instance = new SystemSetManager();
				_instance.init();
			}
			return _instance;
		}
		
		private function init():void
		{
			setBooleanByIndex(SYSTEMSET_LIFE,true);
			setBooleanByIndex(SYSTEMSET_FORCE,true);
			setBooleanByIndex(SYSTEMSET_AUOTBUYITEM,true);
			setBooleanByIndex(SYSTEMSET_AUOT_GET_ITEM,true);
			setBooleanByIndex(SYSTEMSET_SOUND,true);
			setBooleanByIndex(SYSTEMSET_SOUNDEFFECT,true);
			setBooleanByIndex(SYSTEMSET_AUOT_OPTIMIZATION,true);
			
			setBooleanByIndex(SYSTEMSET_AUOT_GET_ALL,true);
			setBooleanByIndex(SYSTEMSET_AUOT_GET_MONEY,true);
			setBooleanByIndex(SYSTEMSET_AUOT_GET_DRUGS,true);
			setBooleanByIndex(SYSTEMSET_AUOT_GET_EQUIPMENT,true);
			setBooleanByIndex(SYSTEMSET_AUOT_GET_MATERIAL,true);
			setBooleanByIndex(SYSTEMSET_AUOT_GET_TASKITEM,true);
			setBooleanByIndex(SYSTEMSET_AUOT_GET_OTHERITEM,true);
			
			
			setValueByIndex(SYSTEMSET_HP_PERCENT,85);
			setValueByIndex(SYSTEMSET_FORCE_PERCENT,85);
			setValueByIndex(SYSTEMSET_USEITEM_PERCENT,0);
			setValueByIndex(SYSTEMSET_HOOK_TYPE,1);
			setValueByIndex(SYSTEMSET_SOUND_BG,30);
			setValueByIndex(SYSTEMSET_SOUND_EFFECT,30);
		}
		private var _lastValue:String="";
		private var _allData:uint=0;
		private var _lifeauot:uint=0;
		private var _forceauot:uint=0;
		private var _itemUse:uint=0;
		private var _hookType:uint = 0;
		private var _soundBg:uint=0;
		private var _soundEffect:uint=0;
		private var _autoGetData:uint = 0;
		public function setData(value:String):void
		{
			_allData 			= stringToUint(value.substr(0,4));
			_lifeauot 			= stringToUint(value.substr(4,1));
			_forceauot 		= stringToUint(value.substr(5,1));
			_itemUse 			= stringToUint(value.substr(6,1));
			_hookType		= stringToUint(value.substr(7,1));
			_soundBg 		= stringToUint(value.substr(8,1));
			_soundEffect 	= stringToUint(value.substr(9,1));
			_autoGetData	= stringToUint(value.substr(10,1));
			_lastValue = value;
		}
		
		public function getBooleanByIndex(type:int):Boolean
		{
			var index :int = Math.floor(type/32);
			type = type%32;
			if(index==0)
				return (_allData&(1<<index))>0;
			else
				return (_autoGetData&(1<<index))>0;
		}
		
		public function getValueByIndex(index:int):int
		{
			switch(index)
			{
				case SYSTEMSET_HP_PERCENT:
					return _lifeauot;
				case SYSTEMSET_FORCE_PERCENT:
					return _forceauot;
				case SYSTEMSET_USEITEM_PERCENT:
					return _itemUse;
				case SYSTEMSET_HOOK_TYPE:
					return _hookType;
				case SYSTEMSET_SOUND_BG:
					return _soundBg;
				case SYSTEMSET_SOUND_EFFECT:
					return _soundEffect;
				default:
					return 0;
			}
		}
		public function setValueByIndex(index:int,value:int):void
		{
			switch(index)
			{
				case SYSTEMSET_HP_PERCENT:
					if(_lifeauot != value)
					{
						_lifeauot = value;
						EventManager.dispatchEvent(SystemEvent.SYS_SET);
					}
					break;
				case SYSTEMSET_FORCE_PERCENT:
					if(_forceauot != value)
					{
						_forceauot = value;
						EventManager.dispatchEvent(SystemEvent.SYS_SET);
					}
					break; 
				case SYSTEMSET_USEITEM_PERCENT:
					if(_itemUse != value)
					{
						_itemUse = value;
						EventManager.dispatchEvent(SystemEvent.SYS_SET);
					}
					break;
				case SYSTEMSET_HOOK_TYPE:
					if(_hookType != value)
					{
						_hookType = value;
						EventManager.dispatchEvent(SystemEvent.SYS_SET);
					}
					break;
				case SYSTEMSET_SOUND_BG:
					if(_soundBg != value)
					{
						_soundBg = value;
						EventManager.dispatchEvent(SystemEvent.SYS_SET);
					}
					break;
				case SYSTEMSET_SOUND_EFFECT:
					if(_soundEffect != value)
					{
						_soundEffect = value;
						EventManager.dispatchEvent(SystemEvent.SYS_SET);
					}
					break;
			}
		}
		public function setBooleanByIndex(type:int,bool:Boolean):void
		{
			var index :int = Math.floor(type/32);
			var pos:int = 1<<(type%32);
			var chageValue:uint ;
			if(index==0)
			{
				chageValue = _allData;
			}else{
				chageValue = _autoGetData;
			}
			
			if(bool)
			{
				chageValue =chageValue|pos;
			}else{
				chageValue = chageValue&(~pos);
			}
			
			if(index==0)
			{
				 _allData = chageValue;
			}else{
				_autoGetData = chageValue;
			}
			EventManager.dispatchEvent(SystemEvent.SYS_SET);
		}
		
		private function stringToUint(str:String):uint
		{
			if(str.length>4)
			{
				GameLog.addShow("【SystemSetManager】【stringToUint（）】超出范围\t");
			}
			var value:uint = 0;
			for(var i:int = 0;i<str.length;i++)
			{
				value=(value<<8);
				value += str.charCodeAt(i);
			}
			return value;
		}
		
		public function saveData():void
		{
			var lastValue:String = _lastValue;
			var nowValue:String = getAllValueToString();
			if(lastValue!= nowValue)
			{
				HeroMiscSender.reqSetClientCustomTag(EnumCustomTagType.SYSTEMSET_INFO , nowValue);
			}
		}
		private function getAllValueToString():String
		{
			var alldata:uint = _allData;
			var value:String = "";
			for(var i:int=0;i<4;i++)
			{
				var char:int = (alldata&0xff);
				value = String.fromCharCode(char)+value;
				alldata=alldata>>8;
			}
			value  += String.fromCharCode(_lifeauot&0xff);
			value  += String.fromCharCode(_forceauot&0xff);
			value  += String.fromCharCode(_itemUse&0xff);
			value  += String.fromCharCode(_hookType&0xff);
			value  += String.fromCharCode(_soundBg&0xff);
			value  += String.fromCharCode(_soundEffect&0xff);
			value  += String.fromCharCode(_autoGetData&0xff);
			return value;
		}
	}
}