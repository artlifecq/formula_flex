package com.rpgGame.app.manager.countryWar
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.display.InterObject3D;
	import com.rpgGame.app.manager.country.CountryManager;
	import com.rpgGame.app.manager.role.MainRoleSearchPathManager;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.country.CountryWarCfgData;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.info.country.countryWar.CountryWarInfoData;
	import com.rpgGame.coreData.info.country.countryWar.CountryWarMonsterLifeData;
	
	import flash.geom.Point;
	
	import app.message.CountryWarReliveMonDataProto;
	
	import starling.core.Starling;
	
	/**
	 * 正在进行的国战状态管理
	 * GuoDong.Zhang
	 * 2016-7-20
	 */
	public class CountryWarStatusManager
	{
		/**进攻方支持的人数*/
		public static var supportAttackCount:int;
		/**防守方支持的人数*/
		public static var supportDefenceCount:int;
		/**观战的人数*/
		public static var watcherCount:int;
		/** 携带复活点的怪物**/
		public static var monsterWithReliveDataVect:Vector.<CountryWarMonsterLifeData>;
		/** 圣兽**/
		public static var monsterHolyDataVect:Vector.<CountryWarMonsterLifeData>;
		/** 神兽*/
		public static var monsterFinalData:CountryWarMonsterLifeData;
		private static var _winInter3DContainer:Inter3DContainer;
		
		public static function clear():void
		{
			supportAttackCount = 0;
			supportDefenceCount = 0;
			monsterWithReliveDataVect = null;
			monsterHolyDataVect = null;
			monsterFinalData = null;
		}
		
		/**
		 * 获取攻防百分比的整数值
		 * @return 
		 * 
		 */
		public static function getSupportAttackPercent():int
		{
			if(supportAttackCount > 0 || supportDefenceCount > 0)
			{
				return Math.round((supportAttackCount/(supportAttackCount + supportDefenceCount))*100);
			}
			return 50;
		}
		
		public static function checkCanAttackFinalMonster():Boolean
		{
			var ownByAttackCount:int = 0;
			var currentWarInfo:CountryWarInfoData = CountryWarManager.getCurrentWarInfo();
			if(currentWarInfo)
			{
				if(monsterHolyDataVect)
				{
					var len:int = monsterHolyDataVect.length;
					for(var i:int = 0; i < len; i++)
					{
						var data:CountryWarMonsterLifeData = monsterHolyDataVect[i];
						if(!CountryManager.isEnemyCountry(data.monsterCountry,currentWarInfo.attackCountry))
						{
							ownByAttackCount++;
						}
					}
				}
			}
			return (ownByAttackCount >= 2);
		}
		
		public static function sortReliveMonsterDataByPriority():void
		{
			if(monsterWithReliveDataVect)
			{
				monsterWithReliveDataVect.sort(sortReliveMonsterDataByPriorityHandler);
			}
		}
		
		public static function getCurrentProgressSceneID():int
		{
			var relieveScene:int;
			var lastDeadIndex:int = getLastDeadMonsterIndex();
			var warInfo:CountryWarInfoData = CountryWarManager.getCurrentWarInfo();
			if(warInfo)
			{
				if(lastDeadIndex < 0)
				{
					relieveScene = CountryWarCfgData.defaultDefenceReliveScene;
				}
				else
				{
					if(monsterWithReliveDataVect)
					{
						var info:CountryWarMonsterLifeData = monsterWithReliveDataVect[lastDeadIndex];
						var data:CountryWarReliveMonDataProto = CountryWarCfgData.getReliveMonsterProto(info.monsterId);
						if(data)
						{
							relieveScene = data.defencerReliveSceneId;
						}
					}
				}
			}
			return relieveScene;
		}
		
		public static function getCurrentReliveSceneName():String
		{
			var relieveScene:int;
			var lastDeadIndex:int = getLastDeadMonsterIndex();
			var warInfo:CountryWarInfoData = CountryWarManager.getCurrentWarInfo();
			if(warInfo)
			{
				if(lastDeadIndex < 0)
				{
					if(!CountryManager.isMyEnemyCountry(warInfo.attackCountry))
					{
						relieveScene = CountryWarCfgData.defaultAttackReliveScene;
					}
					else if(!CountryManager.isMyEnemyCountry(warInfo.defenceCountry))
					{
						relieveScene = CountryWarCfgData.defaultDefenceReliveScene;
					}
				}
				else
				{
					if(monsterWithReliveDataVect)
					{
						var info:CountryWarMonsterLifeData = monsterWithReliveDataVect[lastDeadIndex];
						var data:CountryWarReliveMonDataProto = CountryWarCfgData.getReliveMonsterProto(info.monsterId);
						if(data)
						{
							if(!CountryManager.isMyEnemyCountry(warInfo.attackCountry))
							{
								relieveScene = data.attackerReliveSceneId;
							}
							else if(!CountryManager.isMyEnemyCountry(warInfo.defenceCountry))
							{
								relieveScene = data.defencerReliveSceneId;
							}
						}
					}
				}
			}
			if(relieveScene)
			{
				var sceneName:String = MapDataManager.getMapName(relieveScene);
				return sceneName;
			}
			return "";
		}
		
		public static function getMonsterWithReliveLifeData(cfgID:int):CountryWarMonsterLifeData
		{
			if(monsterWithReliveDataVect)
			{
				var len:int = monsterWithReliveDataVect.length;
				for(var i:int = 0; i < len; i++)
				{
					var data:CountryWarMonsterLifeData = monsterWithReliveDataVect[i];
					if(data.monsterId == cfgID)
					{
						return data;
					}
				}
			}
			return null;
		}
		
		public static function getMonsterHolyLifeData(cfgID:int):CountryWarMonsterLifeData
		{
			if(monsterHolyDataVect)
			{
				var len:int = monsterHolyDataVect.length;
				for(var i:int = 0; i < len; i++)
				{
					var data:CountryWarMonsterLifeData = monsterHolyDataVect[i];
					if(data.monsterId == cfgID)
					{
						return data;
					}
				}
			}
			return null;
		}
		
		/**
		 * 检查是否是神兽
		 * @param cfgID
		 * @return 
		 * 
		 */
		public static function checkIsFinalMonster(cfgID:int):Boolean
		{
			if(monsterFinalData && monsterFinalData.monsterId == cfgID)
			{
				return true;
			}
			return false;
		}
		
		/**
		 * 获取圣兽的索引，-1表示非圣兽
		 * @param cfgID
		 * @return 
		 * 
		 */
		public static function getHolyMonsterIndex(cfgID:int):int
		{
			if(monsterHolyDataVect)
			{
				var len:int = monsterHolyDataVect.length;
				for(var i:int = 0; i < len; i++)
				{
					var monsterData:CountryWarMonsterLifeData = monsterHolyDataVect[i];
					if(monsterData.monsterId == cfgID)
					{
						return i;
					}
				}
			}
			return -1;
		}
		
		/**
		 * 获取带复活点的怪物的索引，-1表示非此类怪
		 * @param cfgID
		 * @return 
		 * 
		 */
		public static function getRelivePointMonsterIndex(cfgID:int):int
		{
			if(monsterWithReliveDataVect)
			{
				var len:int = monsterWithReliveDataVect.length;
				for(var i:int = 0; i < len; i++)
				{
					var monsterData:CountryWarMonsterLifeData = monsterWithReliveDataVect[i];
					if(monsterData.monsterId == cfgID)
					{
						return i;
					}
				}
			}
			return -1;
		}
		
		/**
		 * 获取当前进度场景名称
		 * @return 
		 * 
		 */
		public static function getCurrentSceneName():String
		{
			var currentMonsterData:CountryWarMonsterLifeData = getCurrentLiveMonsterData();
			if(currentMonsterData)
			{
				var sceneID:int =  MonsterDataManager.getMonsterSceneId(currentMonsterData.monsterId);
				return MapDataManager.getMapName(sceneID);
			}
			return "";
		}
		
		/**
		 * 获取当前进度守关怪物名称
		 * @return 
		 * 
		 */
		public static function getCurrentMonsterName():String
		{
			var currentMonsterData:CountryWarMonsterLifeData = getCurrentLiveMonsterData();
			if(currentMonsterData)
			{
				return MonsterDataManager.getMonsterName(currentMonsterData.monsterId);
			}
			return "";
		}
		
		/**
		 * 获取当前进度守关怪物血量
		 * @return 
		 * 
		 */
		public static function getCurrentMonsterLifePercent():int
		{
			var currentMonsterData:CountryWarMonsterLifeData = getCurrentLiveMonsterData();
			if(currentMonsterData)
			{
				return currentMonsterData.bloodProgress;
			}
			return 0;
		}
		
		/**
		 * 获取当前进度所在的守关怪物数据
		 * @return 
		 * 
		 */
		public static function getCurrentLiveMonsterData():CountryWarMonsterLifeData
		{
			var currentMonsterIndex:int = getLastDeadMonsterIndex() + 1;
			if(monsterWithReliveDataVect && currentMonsterIndex < monsterWithReliveDataVect.length)
			{
				return monsterWithReliveDataVect[currentMonsterIndex];
			}
			else
			{
				return monsterFinalData;
			}
			return null;
		}
		
		public static function get isChengMenGuardLive():Boolean
		{
			var lastDeadMonsterIndex:int = getLastDeadMonsterIndex();
			if(lastDeadMonsterIndex < 2)
			{
				return true;
			}
			return false;
		}
		
		/**
		 * 获取权重最大的一个死亡的守关怪物数据
		 * @return 
		 * 
		 */
		public static function getLastDeadMonsterIndex():int
		{
			if(monsterWithReliveDataVect)
			{
				var len:int = monsterWithReliveDataVect.length;
				for(var i:int = len - 1; i >= 0; i--)
				{
					var monsterData:CountryWarMonsterLifeData = monsterWithReliveDataVect[i];
					if(monsterData.bloodProgress <= 0 || monsterData.isDead)
					{
						return i;
					}
				}
			}
			return -1;
		}
		
		public static function walkToMonsterGeneral(index:int):void
		{
			if(monsterWithReliveDataVect)
			{
				var monsterInfo:CountryWarMonsterLifeData = monsterWithReliveDataVect[index];
				var sceneID:int =  MonsterDataManager.getMonsterSceneId(monsterInfo.monsterId);
				var point:Point = MonsterDataManager.getMonsterPositionByCfgID(monsterInfo.monsterId);
				MainRoleSearchPathManager.walkToScene(sceneID, point.x, point.y,null,300);
			}
		}
		
		public static function walkToMonsterHoly(index:int):void
		{
			if(monsterHolyDataVect)
			{
				var monsterInfo:CountryWarMonsterLifeData = monsterHolyDataVect[index];
				var sceneID:int =  MonsterDataManager.getMonsterSceneId(monsterInfo.monsterId);
				var point:Point = MonsterDataManager.getMonsterPositionByCfgID(monsterInfo.monsterId);
				MainRoleSearchPathManager.walkToScene(sceneID, point.x, point.y,null,300);
			}
		}
		
		public static function walkToMonsterFinal():void
		{
			if(monsterFinalData)
			{
				var sceneID:int =  MonsterDataManager.getMonsterSceneId(monsterFinalData.monsterId);
				var point:Point = MonsterDataManager.getMonsterPositionByCfgID(monsterFinalData.monsterId);
				MainRoleSearchPathManager.walkToScene(sceneID, point.x, point.y,null,300);
			}
		}
		
		public static function playEffect(effectName:String,tx:int,ty:int):void
		{
			if(_winInter3DContainer == null)
			{
				_winInter3DContainer = new Inter3DContainer();
				StarlingLayerManager.topUILayer.addChild(_winInter3DContainer);
			}
			_winInter3DContainer.playInter3DAt(ClientConfig.getEffect(effectName),tx,ty,1,onPlayEffectComplete);
		}
		
		public static function playWinEffect():void
		{
			var tx:int = Starling.current.nativeStage.width/2;
			var ty:int = Starling.current.nativeStage.height/2 - 100;
			playEffect("ui_guozhan_shengli",tx,ty);
		}
		
		public static function playLoseEffect():void
		{
			var tx:int = Starling.current.nativeStage.width/2;
			var ty:int = Starling.current.nativeStage.height/2 - 100;
			playEffect("ui_guozhan_shibai",tx,ty);
		}
		
		public static function playKillGuardEffect():void
		{
			var tx:int = Starling.current.nativeStage.width/2;
			var ty:int = Starling.current.nativeStage.height/2 - 100;
			playEffect("ui_shoujiangjipo",tx,ty);
		}
		
		public static function playLoseGuardEffect():void
		{
			var tx:int = Starling.current.nativeStage.width/2;
			var ty:int = Starling.current.nativeStage.height/2 - 100;
			playEffect("ui_shoujiangshibai",tx,ty);
		}
		
		public static function playContinueKillEffect(level:int = 1):void
		{
			var tx:int = Starling.current.nativeStage.width/2;
			var ty:int = Starling.current.nativeStage.height/2 - 100;
			playEffect("ui_guozhanjisha_" + level,tx,ty);
		}
		
		public static function playBreakContinueKillEffect(level:int = 1):void
		{
			var tx:int = Starling.current.nativeStage.width/2;
			var ty:int = Starling.current.nativeStage.height/2 - 100;
			playEffect("ui_guozhanzhongjie_" + level,tx,ty);
		}
		
		private static function onPlayEffectComplete(obj:InterObject3D):void
		{
			_winInter3DContainer.removeChild3D(obj);
		}
		
		private static function sortReliveMonsterDataByPriorityHandler(data1:CountryWarMonsterLifeData,data2:CountryWarMonsterLifeData):int
		{
			var proto1:CountryWarReliveMonDataProto = CountryWarCfgData.getReliveMonsterProto(data1.monsterId);
			var proto2:CountryWarReliveMonDataProto = CountryWarCfgData.getReliveMonsterProto(data2.monsterId);
			if(proto1.relivePosPriority < proto2.relivePosPriority)
			{
				return -1;
			}
			else if(proto1.relivePosPriority > proto2.relivePosPriority)
			{
				return 1;
			}
			return 0;
		}
	}
}