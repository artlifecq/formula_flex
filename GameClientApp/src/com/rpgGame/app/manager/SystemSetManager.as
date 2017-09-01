package com.rpgGame.app.manager
{
	import com.gameClient.log.GameLog;
	import com.gameClient.utils.JSONUtil;
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
		/**自动拾取职业**/
		public  static const SYSTEMSET_AUOT_GET_ZHIYE:int = 39;
		/**自动拾取等阶**/
		public  static const SYSTEMSET_AUOT_GET_DENGJIE:int = 40;
		/**自动拾取品质**/
		public  static const SYSTEMSET_AUOT_GET_PINZHI:int = 41;
		
		/**幻影效果*/
		public  static const SYSTEMSET_HUANYING:int = 42;
		/**混合通道*/
		public  static const SYSTEMSET_HUNHE:int = 43;
		/**增强效果*/
		public  static const SYSTEMSET_ZENGQIANG:int = 44;
		/**扭曲效果*/
		public  static const SYSTEMSET_NIUQU:int = 45;
		/**发光效果*/
		public  static const SYSTEMSET_FAGUANG:int = 46;
		/**阴影品质*/
		public  static const SYSTEMSET_YINYING:int = 47;
		/**渲染倍数*/
		public  static const SYSTEMSET_XUANRAN:int = 48;
		/**抗锯齿*/
		public  static const SYSTEMSET_JUCHI:int = 49;
		/**显示等级*/
		public  static const SYSTEMSET_XIANSHIDENGJI:int = 50;
		
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
			setValueByIndex(SYSTEMSET_HOOK_TYPE,10);
			setValueByIndex(SYSTEMSET_SOUND_BG,30);
			setValueByIndex(SYSTEMSET_SOUND_EFFECT,30);
			setValueByIndex(SYSTEMSET_AUOT_GET_ZHIYE,0);
			setValueByIndex(SYSTEMSET_AUOT_GET_DENGJIE,0);
			setValueByIndex(SYSTEMSET_AUOT_GET_PINZHI,0);
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
		private var _zhiyeData:uint = 0;
		private var _dengjieData:uint = 0;
		private var _pinzhiData:uint = 0;
		public function setData(value:String):void
		{
			var strlists:Array = JSONUtil.decode( value ).split("|");
			_allData 			= uint("0x"+strlists[0]);
			_lifeauot 			= uint("0x"+strlists[1]);
			_forceauot 		= uint("0x"+strlists[2]);
			_itemUse 			= uint("0x"+strlists[3]);
			_hookType		= uint("0x"+strlists[4]);
			_soundBg 		= uint("0x"+strlists[5]);
			_soundEffect 	= uint("0x"+strlists[6]);
			_autoGetData	= uint("0x"+strlists[7]);
			_zhiyeData	= uint("0x"+strlists[8]);
			_dengjieData	= uint("0x"+strlists[9]);
			_pinzhiData	= uint("0x"+strlists[10]);
			trace("SystemSetManager:"+getAllValueToString());
			_lastValue = value;
		}
		
		public function getBooleanByIndex(type:int):Boolean
		{
			var index :int = Math.floor(type/32);
			type = type%32;
			if(index==0)
				return (_allData&(1<<type))>0;
			else
				return (_autoGetData&(1<<type))>0;
		}
		
		public function getValueByIndex(type:int):int
		{
			switch(type)
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
					
				case SYSTEMSET_AUOT_GET_ZHIYE:
					return _zhiyeData;
				case SYSTEMSET_AUOT_GET_DENGJIE:
					return _dengjieData;
				case SYSTEMSET_AUOT_GET_PINZHI:
					return _pinzhiData;
				default:
					return 0;
			}
		}
		public function setValueByIndex(type:int,value:int):void
		{
			switch(type)
			{
				case SYSTEMSET_HP_PERCENT:
					if(_lifeauot != value)
					{
						_lifeauot = value;
						EventManager.dispatchEvent(SystemEvent.SYS_SET,type);
					}
					break;
				case SYSTEMSET_FORCE_PERCENT:
					if(_forceauot != value)
					{
						_forceauot = value;
						EventManager.dispatchEvent(SystemEvent.SYS_SET,type);
					}
					break; 
				case SYSTEMSET_USEITEM_PERCENT:
					if(_itemUse != value)
					{
						_itemUse = value;
						EventManager.dispatchEvent(SystemEvent.SYS_SET,type);
					}
					break;
				case SYSTEMSET_HOOK_TYPE:
					if(_hookType != value)
					{
						_hookType = value;
						EventManager.dispatchEvent(SystemEvent.SYS_SET,type);
					}
					break;
				case SYSTEMSET_SOUND_BG:
					if(_soundBg != value)
					{
						_soundBg = value;
						EventManager.dispatchEvent(SystemEvent.SYS_SET,type);
					}
					break;
				case SYSTEMSET_SOUND_EFFECT:
					if(_soundEffect != value)
					{
						_soundEffect = value;
						EventManager.dispatchEvent(SystemEvent.SYS_SET,type);
					}
					break;
				case SYSTEMSET_AUOT_GET_ZHIYE:
					if(_zhiyeData != value)
					{
						_zhiyeData = value;
						EventManager.dispatchEvent(SystemEvent.SYS_SET,type);
					}
					break;
				case SYSTEMSET_AUOT_GET_DENGJIE:
					if(_dengjieData != value)
					{
						_dengjieData = value;
						EventManager.dispatchEvent(SystemEvent.SYS_SET,type);
					}
					break;
				case SYSTEMSET_AUOT_GET_PINZHI:
					if(_pinzhiData != value)
					{
						_pinzhiData = value;
						EventManager.dispatchEvent(SystemEvent.SYS_SET,type);
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
			EventManager.dispatchEvent(SystemEvent.SYS_SET,type);
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
				HeroMiscSender.reqSetClientCustomTag(EnumCustomTagType.SYSTEM_SET , JSONUtil.encode(nowValue));
			}
		}
		private function getAllValueToString():String
		{
			var alldata:uint = _allData;
			var value:String = _allData.toString(16);
			value  += "|"+_lifeauot.toString(16);
			value  += "|"+_forceauot.toString(16);
			value  += "|"+_itemUse.toString(16);
			value  += "|"+_hookType.toString(16);
			value  += "|"+_soundBg.toString(16);
			value  += "|"+_soundEffect.toString(16);
			value  += "|"+_autoGetData.toString(16);
			value  += "|"+_zhiyeData.toString(16);
			value  += "|"+_dengjieData.toString(16);
			value  += "|"+_pinzhiData.toString(16);
			return value;
		}
	}
}