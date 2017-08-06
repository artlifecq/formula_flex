package com.rpgGame.app.manager
{
	import com.rpgGame.coreData.cfg.AttValueConfig;
	import com.rpgGame.coreData.cfg.DailyZoneMonsterCfgData;
	import com.rpgGame.coreData.cfg.MibaoCfgData;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.clientConfig.Q_att_values;
	import com.rpgGame.coreData.clientConfig.Q_dailyzone_monster;
	import com.rpgGame.coreData.clientConfig.Q_mibao_monster;
	import com.rpgGame.coreData.clientConfig.Q_monster;
	import com.rpgGame.netData.mibao.bean.RemainMonsterInfo;

	public class MibaoManager
	{
		private static var monsterInfoList:Vector.<RemainMonsterInfo>;
		public static var zoneid:int;
		public static function monsterListInit(datalist:Vector.<RemainMonsterInfo>):void
		{
			monsterInfoList=datalist;
			
		}
		public static function monsterChange(monsterdata:RemainMonsterInfo):void
		{
			if(!monsterInfoList)
				return;
			var i:int;
			for(i=0;i<monsterInfoList.length;i++)
			{
				if(monsterInfoList[i].monsterId==monsterdata.monsterId)
				{
					monsterInfoList[i].remainingNum=monsterdata.remainingNum;
				}
			}
		}
		/**返回当前波数*/
		public static function getCurrWave():int
		{
			var waveList:Array=MibaoCfgData.getWaveIdList(zoneid);
			var monsterList:Vector.<Q_mibao_monster>;
			var i:int,j:int;
			for(i=0;i<waveList.length;i++)
			{
				if(!isKillAllByWave(waveList[i]))
				{
					return waveList[i];
				}
				
				
			}
			
			
			return 0;
		}
		/**返回boss波数*/
		public static function getBossWave():int
		{
			var bossInfo:Vector.<Q_mibao_monster>=MibaoCfgData.getMonsterListByType(2);
			if(bossInfo&&bossInfo.length>0)
			{
				return bossInfo[0].q_step;
			}
			
			return 0;
		}
		/**返回boss的血量*/
		public static function getBossHp():int
		{
			var bossInfo:Vector.<Q_mibao_monster>=MibaoCfgData.getMonsterListByType(2);
			if(bossInfo&&bossInfo.length>0)
			{
				var zoneMonster:Q_dailyzone_monster=DailyZoneMonsterCfgData.getZoneCfg(bossInfo[0].q_id);
				if(zoneMonster)
				{
					var monsterData:Q_monster=MonsterDataManager.getData(zoneMonster.q_monsterId);
					if(monsterData)
					{
						var currentatt:int = AttValueConfig.getQattValueByType(monsterData.q_att_type,12);
						return currentatt;
					}
				}
			}
			
			return 0;
		}
		
		
		
		/**1阶段的小怪是否杀死完*/
		public static function isKillAllBytype():Boolean
		{
			if(monsterInfoList)
			{
				var monsterData:Q_mibao_monster;
				
				var i:int;
				for(i=0;i<monsterInfoList.length;i++)
				{
					monsterData=MibaoCfgData.getMonster(monsterInfoList[i].monsterId);
					if(monsterData.q_type==1&&!isKillAllByid(monsterInfoList[i].monsterId))
					{
						return false
					}
				}
				return true;
			}
			
			return false;
			
			
		}
		/**返回怪物是否杀完 by 波数*/
		public static function isKillAllByWave(wave:int):Boolean
		{
			var monsterList:Vector.<Q_mibao_monster>=MibaoCfgData.getMonsterListByWaveId(zoneid,wave);
			if(monsterList)
			{
				var i:int,j:int;
				for(j=0;j<monsterList.length;j++)
				{
					if(!isKillAllByid(monsterList[j].q_id))
					{
						return false;
					}
				}
				return true;
			}
			return false;
		}
		
		
		/**返回怪物是否杀完 by id*/
		public static function isKillAllByid(id:int):Boolean
		{
			var monsterInfo:RemainMonsterInfo=getMonsterInfo(id);
			if(monsterInfo&&monsterInfo.remainingNum==0)
			{
				return true;
			}
			
			return false;
		}
		
		public static function getMonsterInfo(id:int):RemainMonsterInfo
		{
			if(monsterInfoList)
			{
				var i:int;
				for(i=0;i<monsterInfoList.length;i++)
				{
					if(monsterInfoList[i].monsterId==id)
					{
						return monsterInfoList[i];
					}
				}
			}
			return null;
		}
		public function MibaoManager()
		{
		}
	}
}