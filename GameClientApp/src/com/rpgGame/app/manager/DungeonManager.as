package com.rpgGame.app.manager
{
	import com.rpgGame.coreData.cfg.DailyZoneMonsterCfgData;
	import com.rpgGame.coreData.clientConfig.Q_dailyzone_monster;
	import com.rpgGame.netData.zone.bean.KillMonsterInfo;
	import com.rpgGame.netData.zone.bean.MultiZonePanelInfo;
	
	import flash.geom.Point;
	
	import org.game.netCore.data.long;

	public class DungeonManager
	{
		/**当前副本id*/
		public static var curryZoneId:int;
		/**副本当前阶段*/
		public static var zoneStage:int;
		/**副本当前波数*/
		public static var zoneWave:int;
		/**副本剩余时间*/
	 	public static var remainTime:int;	
		/**击杀列表*/
		public static var killInfos: Vector.<KillMonsterInfo>;
		/**是否在面板上领取奖励*/
		public static  var isReward:Boolean=false;
		/**通关奖励0不能领1可领取*/
		public static  var passReward: int=0;
		/**通关总次数奖励0不能领1可领取*/
		public static var extraReward: int=0;
		
		public static var outTime: int=0;
		/**总挑战次数*/
		public static var challengeCount: int=0;
		/**各副本通关次数*/
		public static var panelInfos: Vector.<MultiZonePanelInfo>;
		/**进入匹配 副本id*/
		public static var teamZid:int=0;
		/**投票副本id*/
		public static var voteZid:int=0;
		public static var voteList:Array;
		
		
		/**返回副本对应阶段的 文字描述*/
		public static function setKillInfos(info:KillMonsterInfo):void
		{
			if(killInfos&&killInfos.length>0)
			{
				for(var i:int;i<killInfos.length;i++)
				{
					if(killInfos[i].monsterModelId==info.monsterModelId)
					{
						killInfos[i].count=info.count;
						return;
					}
				}
			}
			
			
		}
		public static function setPanelInfos(zoneId:int,count:int,rewardCount:int):void
		{
			if(panelInfos&&panelInfos.length>0)
			{
				for(var i:int;i<panelInfos.length;i++)
				{
					if(panelInfos[i].zoneId==zoneId)
					{
						panelInfos[i].count=count;
						panelInfos[i].rewardCount=rewardCount;
						return;
					}
				}
			}
			
			
		}
		public static function getPanelInfo(zoneId:int):MultiZonePanelInfo
		{
			if(panelInfos&&panelInfos.length>0)
			{
				for(var i:int;i<panelInfos.length;i++)
				{
					if(panelInfos[i].zoneId==zoneId)
					{
						return panelInfos[i];
					}
				}
			}
			
			return null;
		}
		
		/**返回追踪面板文字*/
		public static function getZoneStageDesc():String
		{
			var str:String="";
			var zmonstrList:Array=DailyZoneMonsterCfgData.getTypeList(curryZoneId);
			if(zmonstrList&&zmonstrList.length>0)
			{
				var zmonster:Q_dailyzone_monster;
				for(var i:int=0;i<zmonstrList.length;i++)
				{
					zmonster=zmonstrList[i];
					if(zmonster&&zmonster.q_stage==zoneStage&&zmonster.q_desc!="")//取当前阶段第一波的描述文字
					{
						return zmonster.q_desc;	
					}
				}
			}
			return str;			
		}
		/**返回未完成id*/
		public static function getKillNoAllID():int
		{
			
			if(killInfos&&killInfos.length>0)
			{
				var qzm:Q_dailyzone_monster;
				for(var i:int;i<killInfos.length;i++)
				{
					qzm=DailyZoneMonsterCfgData.getZoneCfg(killInfos[i].monsterModelId);
					if(qzm&&killInfos[i].count<qzm.q_monsterNum)
					{
						return i;
					}
				}
			}
			return 0; 
		}
		
		/**返回各阶段自动寻路点*/
		public static function getStagePos(id:int):Point
		{
			if(killInfos==null||killInfos.length<=id)return null;
			var kinfo:KillMonsterInfo=killInfos[id];
			if(kinfo==null)return null;
			var zmonstrList:Array=DailyZoneMonsterCfgData.getTypeList(curryZoneId);
			if(zmonstrList&&zmonstrList.length>0)
			{
				var zmonster:Q_dailyzone_monster;
				for(var i:int=0;i<zmonstrList.length;i++)
				{
					zmonster=zmonstrList[i];
					if(zmonster&&zmonster.q_id==kinfo.monsterModelId&&(zmonster.q_move_x>0||zmonster.q_move_y>0))
					{
						var pot:Point=new Point();
						pot.x=zmonster.q_move_x;
						pot.y=-Math.abs(zmonster.q_move_y);
						return pot;
					}
				}
			}
			return null;		
		}
		/**根据下标返回当前阶段的波数id*/
		public static function getStageWave(id:int):int
		{
			var zmonstrList:Array=DailyZoneMonsterCfgData.getTypeList(curryZoneId);
			if(zmonstrList&&zmonstrList.length>0)
			{
				var zmonster:Q_dailyzone_monster;
				var add:int=0;
				for(var i:int=0;i<zmonstrList.length;i++)
				{
					zmonster=zmonstrList[i];
					if(zmonster&&zmonster.q_stage==zoneStage)
					{
						if(add==id)
						{
							return zmonster.q_wave;
						}
						add++;
					}
				}
			}
			return 0;	
		}
		
		/**创建进入匹配队伍投票列表*/
		public static function createZoneTeam(zid:int,pid:long,result:int):void
		{
			if(voteZid!=zid)
			{
				voteList=new Array();
				voteZid=zid;
			}
			if(voteList)
			{
				voteList.push([pid,result]);
			}
			
		}
		/**创建进入匹配队伍投票列表*/
		public static function isAllTeamOk():void
		{
			
			
		}
		public static function isVote(mid:long):Boolean
		{
			var i:int;
			for(i=0;i<voteList.length;i++)
			{
				if(mid.EqualTo(voteList[i][0])&&voteList[i][1]==1)
				{
					return true;
				}
			}
			
			return false;
		}
		
		
		
		public function DungeonManager()
		{
		}
	}
}