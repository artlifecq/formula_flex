package com.rpgGame.app.manager
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.core.events.ZhanGongEvent;
	import com.rpgGame.coreData.cfg.ZhanGongData;
	import com.rpgGame.coreData.clientConfig.Q_meritorious;
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
			if(_meritoriousInfos==null) return "0%";
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
			var par:String=(nowLv/maxLv).toFixed(1)+"%";
			
			return par;
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
	}	
}