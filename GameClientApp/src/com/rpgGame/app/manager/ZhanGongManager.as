package com.rpgGame.app.manager
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.core.events.ZhanGongEvent;
	import com.rpgGame.coreData.cfg.AttValueConfig;
	import com.rpgGame.coreData.cfg.ZhanGongData;
	import com.rpgGame.coreData.clientConfig.Q_att_values;
	import com.rpgGame.coreData.clientConfig.Q_meritorious;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	import com.rpgGame.coreData.utils.ZhanGongUtil;
	import com.rpgGame.netData.zhangong.bean.MeritoriousInfo;
	import com.rpgGame.netData.zhangong.message.SCMeritoriousInfoListMessage;
	import com.rpgGame.netData.zhangong.message.SCMeritoriousUpgradeResultMessage;
	
	import org.client.mainCore.manager.EventManager;
	
	public class ZhanGongManager
	{
		private static var _meritoriousInfos: Vector.<MeritoriousInfo>;
		private static var _power:int=0;
		public function ZhanGongManager()
		{
			
		}
		
		/**
		 * 刷新数据
		 * */
		public static function sCMeritoriousInfoListMessage(msg:SCMeritoriousInfoListMessage):void
		{
			_meritoriousInfos=msg.meritoriousInfos;
			_power=msg.fightPower;
		}
		
		/**
		 * 更新单个数据
		 * */
		public static function updateList(msg:SCMeritoriousUpgradeResultMessage):void
		{
			
			if(msg.flag==1)
			{
				_power=msg.fightPower;
				if(_meritoriousInfos!=null)
				{
					for(var i:int=0;i<_meritoriousInfos.length;i++)
					{
						if(_meritoriousInfos[i].type==msg.meritoriousInfo.type)
						{
							_meritoriousInfos[i]=msg.meritoriousInfo;
						}
					}
				}
				EventManager.dispatchEvent(ZhanGongEvent.BOSSITEM_CHANGE,msg);
			}	
		}
		
		/**
		 * 依据类型获取相应的Info
		 * */
		public static function getInfoByType(type:int):MeritoriousInfo
		{
			if(_meritoriousInfos==null) return null;
			
			var info:MeritoriousInfo;
			for(var i:int=0;i<_meritoriousInfos.length;i++)
			{
				info=_meritoriousInfos[i];
				if(info.type==type) return info;
			}
			return null;
		}
		
		/**
		 * 获取当前的战斗力
		 * */
		public static function getPower():int
		{
			return _power;
		}
		
		/**
		 * 获取相应等级的类型的完成进度
		 * */
		public static function getProgressByLv(lv:int):String
		{
			if(_meritoriousInfos==null) return "0.000%";
			var nowLv:int=0;
			var maxLv:int=0;
			for(var i:int=0;i<_meritoriousInfos.length;i++)
			{
				var info:MeritoriousInfo=_meritoriousInfos[i];
				if(info.LevelType==lv)
				{
					nowLv+=info.level;
					maxLv+=ZhanGongData.getMaxLvByType(info.type);
				}
			}		
			if(maxLv!=0)
			{
				var par:String=(nowLv/maxLv).toFixed(3)+"%";
			}
			else
				par="0.000%";
			
			return par;
		}
		public static function getCanUp():Boolean
		{
			var list:Vector.<int>=ZhanGongData.getMapItemLvList();
			for each (var lv:int in list) 
			{
				if (getCanUpNumByLv(lv)) 
				{
					return true;
				}
			}
			return false;
		}
		/**
		 * 获取相应等级的可升级个数
		 * */
		public static function getCanUpNumByLv(lv:int):int
		{
			var num:int=0;
			if(_meritoriousInfos==null) return num;			
			var haveNum:int=0;
			var useNum:int=0;
			var q_meritorious:Q_meritorious;
			for(var i:int=0;i<_meritoriousInfos.length;i++)
			{
				var info:MeritoriousInfo=_meritoriousInfos[i];
				var id:String=info.level.toString()+"_"+info.type;
				q_meritorious=ZhanGongData.getmeritoriousById(id);
				if(q_meritorious)
				{
					if(info.LevelType==lv&&!ZhanGongData.isMax(info.type,info.level))
					{
						haveNum=MainRoleManager.actorInfo.totalStat.getResData(q_meritorious.q_materil);
						useNum=q_meritorious.q_num;
						if(haveNum>=useNum) num++;
					}
				}
			}
			return num;
		}
		
		/**
		 * 获取所有怪物加成属性
		 * */
		public static function getAllAttrbut():String
		{
			var str:String="";
			if(_meritoriousInfos==null) return "当前无属性加成";
			var meritorious:Q_meritorious;
			var attValues:Q_att_values;
			var maps:HashMap;
			var zongMaps:HashMap=new HashMap();
			for(var i:int=0;i<_meritoriousInfos.length;i++)
			{
				if(_meritoriousInfos[i].level>0)
				{
					var id:String=_meritoriousInfos[i].level+"_"+_meritoriousInfos[i].type;
					meritorious=ZhanGongData.getmeritoriousById(id);
					attValues=AttValueConfig.getAttInfoById(ZhanGongUtil.getAttByJob(meritorious,MainRoleManager.actorInfo.job));
					maps=AttValueConfig.getTypeValueMap(attValues);
					zongMaps=MergeMaps(zongMaps,maps);
				}
			}
			for each(var key:int in zongMaps.keys())
			{
				str+=HtmlTextUtil.getTextColor(0x8B8D7B,CharAttributeType.getCNName(key))+": "+HtmlTextUtil.getTextColor(0x5cb006,"+"+AttValueConfig.getDisAttValue(key,zongMaps.getValue(key)))+"\n";
			}
			if(str==null||str=="") str="当前无属性加成";
			return str;
		}
		
		/**
		 * 获取下一级增加的属性
		 * */
		public static function getNextNumber(type:int,nowlv:int):String
		{
			var meritorious1:Q_meritorious;
			var attValues1:Q_att_values;
			var maps1:HashMap;
			var keys1:Array;
			
			var meritorious2:Q_meritorious;
			var attValues2:Q_att_values;
			var maps2:HashMap;
			var keys2:Array;
			if(!ZhanGongData.isMax(type,nowlv))
			{
				var id1:String=nowlv.toString()+"_"+type;
				var id2:String=(nowlv+1).toString()+"_"+type;
				meritorious1=ZhanGongData.getmeritoriousById(id1);
				meritorious2=ZhanGongData.getmeritoriousById(id2);
				
				attValues1=AttValueConfig.getAttInfoById(ZhanGongUtil.getAttByJob(meritorious1,MainRoleManager.actorInfo.job));
				maps1=AttValueConfig.getTypeValueMap(attValues1);
				keys1=maps1.keys();
				attValues2=AttValueConfig.getAttInfoById(ZhanGongUtil.getAttByJob(meritorious2,MainRoleManager.actorInfo.job));
				maps2=AttValueConfig.getTypeValueMap(attValues2);
				keys2=maps2.keys();
				var num:String=keys1[0]+"_"+AttValueConfig.getDisAttValueStr(keys2[0],(maps2.getValue(keys2[0])-maps1.getValue(keys1[0])));
				return num;
			}
			return "";
		}
		
		private static function MergeMaps(mainmaps:HashMap,maps:HashMap):HashMap
		{
			var val :int;
			for each(var key:int in maps.keys())
			{
				if ( mainmaps.containsKey( key ) )
				{
					val = mainmaps.getValue( key ) + maps.getValue( key );
					if ( val == 0 )
						mainmaps.remove( key );
					else
						mainmaps.put( key, val );
				}
				else
					mainmaps.put( key, maps.getValue( key ) );
			}
			return mainmaps;
		}
	}	
}