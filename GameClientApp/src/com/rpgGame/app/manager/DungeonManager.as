package com.rpgGame.app.manager
{
	import com.rpgGame.coreData.cfg.DailyZoneMonsterCfgData;
	import com.rpgGame.coreData.clientConfig.Q_dailyzone_monster;
	import com.rpgGame.netData.zone.bean.KillMonsterInfo;

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
		
		
		/**返回副本对应阶段的 文字描述*/
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
					if(zmonster&&zmonster.q_stage==zoneStage&&zmonster.q_wave==1)//取当前阶段第一波的描述文字
					{
						return zmonster.q_desc;	
					}
				}
			}
			return str;			
		}
		
		public static function changeKillInfos(info:KillMonsterInfo):void
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
		
		
		
		public function DungeonManager()
		{
		}
	}
}