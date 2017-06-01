package com.rpgGame.app.manager
{
	import com.rpgGame.coreData.cfg.DailyZoneMonsterCfgData;
	import com.rpgGame.coreData.clientConfig.Q_dailyzone_monster;
	import com.rpgGame.netData.zone.bean.KillMonsterInfo;
	
	import flash.geom.Point;

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
					if(zmonster&&zmonster.q_stage==zoneStage&&zmonster.q_desc!="")//取当前阶段第一波的描述文字
					{
						return zmonster.q_desc;	
					}
				}
			}
			return str;			
		}
		
		/**返回各阶段自动寻路点*/
		public static function getStagePos(wave:int):Point
		{
			var zmonstrList:Array=DailyZoneMonsterCfgData.getTypeList(curryZoneId);
			if(zmonstrList&&zmonstrList.length>0)
			{
				var zmonster:Q_dailyzone_monster;
				for(var i:int=0;i<zmonstrList.length;i++)
				{
					zmonster=zmonstrList[i];
					if(zmonster&&zmonster.q_wave==wave&&(zmonster.q_move_x>0||zmonster.q_move_y>0))
					{
						var pot:Point=new Point();
						pot.x=zmonster.q_move_x;
						pot.y=-Math.abs(zmonster.q_move_y);
						return pot;
					}
				}
			}
			return null		
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