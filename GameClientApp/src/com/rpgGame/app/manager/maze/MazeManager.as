package com.rpgGame.app.manager.maze
{
	import com.game.engine3D.core.AreaMap;
	import com.rpgGame.app.cmdlistener.SummonSender;
	import com.rpgGame.app.manager.AreaMapManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.country.CountryManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.SceneRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.sender.MazeSender;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.app.utils.TimeData;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.MazeEvent;
	import com.rpgGame.coreData.cfg.MazeCfgData;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.npc.NpcCfgData;
	import com.rpgGame.coreData.enum.AlertClickTypeEnum;
	import com.rpgGame.coreData.enum.AreaMapTypeEnum;
	import com.rpgGame.coreData.enum.EnumAreaMapType;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.info.map.SceneData;
	import com.rpgGame.coreData.info.task.PrizeInfo;
	import com.rpgGame.coreData.lang.LangAlertInfo;
	import com.rpgGame.coreData.lang.LangMaze;
	import com.rpgGame.coreData.role.RoleType;
	import com.rpgGame.coreData.role.SceneTranportData;
	import com.rpgGame.coreData.type.SceneCharType;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
	import app.message.AmountType;
	import app.message.MazeAllRankProto;
	import app.message.MazeDungeonProto;
	import app.message.MazeHeroInfoProto;
	import app.message.MazeLevelPrizeDataProto;
	import app.message.MazePrizeDataProto;
	import app.message.MazeRankObjProto;
	import app.message.MazeRankProto;
	import app.message.NpcDialogProto;
	import app.message.PrizeProto;
	import app.message.SceneProto;
	import app.message.NpcDialogProto.NpcType;
	
	import org.client.mainCore.manager.EventManager;
	
	import utils.TimerServer;

	public class MazeManager
	{
		public function MazeManager()
		{
		}
		private static var _mazeStartTime : Number;
		private static var _mazeEndTime : Number;
		private static var callId : int;
		private static var callEndTime : Number;
		/**
		 * 是否通关了
		 */
		public static var isFinished : Boolean;
		/**
		 * 上次的数据
		 */
		public static var lastMazeRank : MazeAllRankProto;

		/**
		 * 领取过奖励的npcid
		 */
		public static var collectPrizeFloors : Array = [];
		/**
		 * 当前的所有数据
		 */
		public static var mazeRank : MazeAllRankProto;

		/**
		 * 需要领取奖励才能进入下一层的层数
		 */
//		private static var mazeGetPrizeToNextFloors : Array = LanguageConfig.getText(LangMaze.mazeGetPrizeToNext).split(",");

		/**
		 * 副本结束了
		 * @param mazeRank
		 *
		 */
		public static function mazeEnd(rank : MazeRankProto) : void
		{
			if (!rank || !rank.rankObjs || rank.rankObjs.length == 0)
			{
//				GameAlert.debugShow("迷宫结束了，但是发过来的数据有问题，所以提示不了");
				return;
			}
			for (var i : int = 0; i < rank.rankObjs.length; i++)
			{
				var maze : MazeRankObjProto = rank.rankObjs[i];
				NoticeManager.showNotify(LangMaze.mazeEndBroadcast, "[" + CountryManager.getCountryName(maze.country) + "]" + maze.name, i+1);
			}

		}
		/**
		 * 进入迷宫副本了，前段准备一些东西，比如离开倒计时之类的 
		 * 
		 */		
		public static function enterMazeDungeon():void
		{
			if(mazeEndTime == 0)
			{
				GameAlert.debugShow("迷宫离开倒计时初始化失败了");
				return;
			}
		}
		
		/**
		 * 领取奖励并且完成副本了
		 * @param npc
		 *
		 */
		public static function collectFloorPrizeAndEnterNext(npc : int) : void
		{
			NoticeManager.showNotify("领取奖励成功");
			collectFloorPrize(npc);
			isFinished = true;
			createMazeTrans();
		}

		/**
		 * 领取迷宫奖励
		 * @param npc
		 *
		 */
		public static function collectFloorPrize(npc : int) : void
		{
			NoticeManager.showNotify("领取奖励成功");
			if (collectPrizeFloors.indexOf(npc) != -1)
			{
				trace("给过来一个已经领取过的迷宫奖励?");
				return;
			}
			collectPrizeFloors.push(npc);
			createMazeTrans();
		}

		/**
		 * 是否这层的奖励已经领取了
		 * @return
		 *
		 */
		public static function isGetNowFloorPrize() : Boolean
		{
			var scene : SceneData = MapDataManager.currentScene;
			if (!scene)
				return false;
			return collectPrizeFloors.indexOf(scene.floor) != -1;
		}

		/**
		 * 当前的迷宫信息
		 * @param rank
		 *
		 */
		public static function rankBroadcast(rank : MazeAllRankProto) : void
		{
			mazeRank = rank;
			trace("排行榜更新了");
			EventManager.dispatchEvent(MazeEvent.MAZE_CHANGE);
		}

		/**
		 * 更新副本信息
		 * @param heroInfo
		 *
		 */
		public static function dungeonInfoChange(heroInfo : MazeHeroInfoProto) : void
		{
			isFinished = heroInfo.isFinished;
			collectPrizeFloors = heroInfo.collectPrizeFloors;
			mazeWaitGetPrize();
			mazeWaitStart();
		}

		public static function getLastRank(mazeAll : MazeAllRankProto) : void
		{
			AppManager.showAppNoHide(AppConstant.MAZE_LAST_RANL_PANEL);
			lastMazeRank = mazeAll;
			EventManager.dispatchEvent(MazeEvent.LAST_MAZE_CHANGE);
		}

		public static function reqLastRank() : void
		{
			MazeSender.getLastRank();
		}

		/**
		 * 迷宫即将开始了，所以初始化这些数据并且提示
		 * @param start
		 * @param end
		 * @param call
		 * @param callEnd
		 *
		 */
		public static function mazeWillStart(start : Number, end : Number, call : int, callEnd : Number) : void
		{
			mazeStartTime = start;
			mazeEndTime = end;
			callId = call;
			callEndTime = callEnd;
			TimerServer.remove(mazeWillEndNotice);
			TimerServer.remove(cancelCallAlert);
			var sceneData : SceneData = MapDataManager.currentScene;
			if(!sceneData || sceneData.isSpecialDungeon)
				return;
			GameAlert.showAlertUtil(LangAlertInfo.mazeCall,mazeWillStartClick);
			TimerServer.add(cancelCallAlert, callEnd - SystemTimeManager.curtTm);
			
			TimerServer.add(mazeWillEndNotice,mazeEndTime - SystemTimeManager.curtTm - 60000);
		}
		
		private static function mazeWillEndNotice():void
		{
			NoticeManager.showNotify(LangMaze.mazeWillEndLater);
		}
		
		private static function mazeWillStartClick(gameAlert:GameAlert):void
		{
			switch(gameAlert.clickType)
			{
				case AlertClickTypeEnum.TYPE_SURE:
					sureCall();
					break;
			}
		}

		public static function dungeonInfo(start : Number, end : Number) : void
		{
			mazeStartTime = start;
			mazeEndTime = end;
			mazeWaitStart();
		}

		public static function firstEnterScene() : void
		{
			var data : TimeData = new TimeData(MazeCfgData.timeData);
			var dat : Date = data.getNextTime();
			mazeStartTime = dat.time;
			var time : Number = dat.time - SystemTimeManager.curtTm;
			if (time > 0)
			{
				trace(TimeUtil.changeTimeToSpecStr(time - MazeCfgData.prepareTime))
				TimerServer.add(alertMazeStart, time - MazeCfgData.prepareTime);
			}
			if (time < 0 && dat.time + MazeCfgData.duration < SystemTimeManager.curtTm)
			{
				trace("还在迷宫活动里面，提示一下");
				NoticeManager.showNotify("迷宫活动开始了，马上进入");
			}
			trace(TimeUtil.changeDateToSpecStr(dat));
		}

		private static function alertMazeStart() : void
		{
			var sceneData : SceneData = MapDataManager.currentScene;
			if(!sceneData || sceneData.isMazeScene)
				return;
			AppManager.showAppNoHide(AppConstant.MAZE_ALERT_PANEL);
		}

		private static function cancelCallAlert() : void
		{
			GameAlert.closeAlert(LangAlertInfo.mazeCall);
		}

		/**
		 * 响应召唤，传送过去
		 *
		 */
		private static function sureCall() : void
		{
			SummonSender.officeSummon(callId);
		}

		public static function get mazeEndTime() : Number
		{
			return _mazeEndTime;
		}

		public static function set mazeEndTime(value : Number) : void
		{
			_mazeEndTime = value;
		}

		public static function getRankColor(rank : int) : uint
		{
			switch (rank)
			{
				case 1:
					return StaticValue.Q_YELLOW;
				case 2:
					return StaticValue.Q_PURPLE;
				case 3:
					return StaticValue.Q_BLUE;
				case 4:
					return StaticValue.Q_GREEN;
				case 5:
					return StaticValue.Q_WHITE;
			}
			return 0xfff;
		}

		public static function getRankColorName(rank : int) : String
		{
			return HtmlTextUtil.getTextColor(MazeManager.getRankColor(rank), "圣兽");
		}

		public static function get mazeStartTime() : Number
		{
			return _mazeStartTime;
		}

		public static function set mazeStartTime(value : Number) : void
		{
			_mazeStartTime = value;
		}
		public static var selectNpcModel : int;

		public static function getPrize() : PrizeProto
		{
			var npc : NpcDialogProto = NpcCfgData.getNpcDialog(selectNpcModel, NpcType.MAZE_PRIZE);
			if (!npc || !npc.hasMazePrize || !npc.mazePrize.data)
				return null;
			var mazePrizeProto : MazeLevelPrizeDataProto = npc.mazePrize.data;
			if (!mazePrizeProto.datas)
				return null;
			var levelPrize : MazePrizeDataProto;
			for (var i : int = mazePrizeProto.datas.length - 1; i >= 0; i--)
			{
				levelPrize = mazePrizeProto.datas[i];
				if (levelPrize && MainRoleManager.actorInfo.level <= levelPrize.level)
					return levelPrize.prize;
			}
			return null;
		}

		public static function getPrizeExp() : Number
		{
			var prize : PrizeInfo = new PrizeInfo();
			prize.converData(getPrize());
			if (prize.moneyAmount)
			{
				return prize.moneyAmount.getAmountByType(AmountType.EXP);
			}
			return 0;
		}

		public static function getNextFloorPrizeExp() : Number
		{
			var prize : PrizeInfo = new PrizeInfo();
			prize.converData(getNextFloorPrize());
			if (prize.moneyAmount)
			{
				return prize.moneyAmount.getAmountByType(AmountType.EXP);
			}
			return 0;
		}

		public static function getNextFloorPrize() : PrizeProto
		{
			var npc : NpcDialogProto = NpcCfgData.getNpcDialog(selectNpcModel, NpcType.MAZE_PRIZE_AND_ENTER_NEXT);
			if (!npc || !npc.hasMazePrizeAndEnterNext || !npc.mazePrizeAndEnterNext.data)
				return null;
			var mazePrizeProto : MazeLevelPrizeDataProto = npc.mazePrizeAndEnterNext.data;
			if (!mazePrizeProto.datas)
				return null;
			var levelPrize : MazePrizeDataProto;
			for (var i : int = mazePrizeProto.datas.length - 1; i >= 0; i--)
			{
				levelPrize = mazePrizeProto.datas[i];
				if (MainRoleManager.actorInfo.level <= levelPrize.level)
					return levelPrize.prize;
			}
			return null;
		}

		private static var lastSceneIsMaze : Boolean;
		private static var lastFloor : int = 0;

		/**
		 * 进入副本或者层数的时候
		 *
		 */
		public static function enterDungeonOrFloor() : void
		{
			var sceneData : SceneData = MapDataManager.currentScene;
			if (!sceneData)
				return;
			if (lastSceneIsMaze)
			{
				if (sceneData.floor > 0 )
				{
					if (lastFloor > sceneData.floor)
					{
						NoticeManager.showNotify(LangMaze.mazeLostFloor, sceneData.floor);
					}
					else
					{
						NoticeManager.showNotify(LangMaze.mazeAddFloor, sceneData.floor);
					}
				}
			}
			lastFloor = sceneData.floor;
			lastSceneIsMaze = sceneData.isMazeScene;

		}

		/**
		 * 迷宫等待开始，先把传送门全拿掉
		 *
		 */
		public static function mazeWaitStart() : void
		{
			if (mazeStartTime > SystemTimeManager.curtTm)
			{
				var sceneData : SceneData = MapDataManager.currentScene;
				if (!sceneData)
					return;
				if (!sceneData.isMazeScene || sceneData.floor != 1)
					return; //如果不在迷宫副本，或者层数不是第一层，那肯定是有问题
				removeMazeFloorTrans();
				TimerServer.add(createMazeTrans, mazeStartTime - SystemTimeManager.curtTm)
			}
		}

		public static function mazeWaitGetPrize() : void
		{
			var sceneData : SceneData = MapDataManager.currentScene;
			if (!sceneData)
				return;
			if (sceneData.hasMazePrizeNpc)
			{
				if (isGetNowFloorPrize())
				{
					createMazeTrans();
				}
				else
					removeMazeFloorTrans();
			}
			else
				createMazeTrans();
		}

		/**
		 * 移除掉场景上面的所有的传送门和区域
		 *
		 */
		public static function removeMazeFloorTrans() : void
		{
			var otherAreaMap : AreaMap = SceneManager.getScene().getAreaMap(EnumAreaMapType.OTHER_AREA);
			var transportList : Array = SceneManager.getScene().getSceneObjsByType(SceneCharType.TRANS);
			for each (var transRole : SceneRole in transportList)
			{
				var info : SceneTranportData = transRole.data as SceneTranportData;
				otherAreaMap.removeFlag(AreaMapTypeEnum.TRANS, info.id);
				SceneManager.removeSceneObjFromScene(transRole);
			}
		}

		/**
		 * 创建迷宫传送门
		 *
		 */
		public static function createMazeTrans() : void
		{
			//迷宫传送门
			var sceneData : SceneData = MapDataManager.currentScene;
			if (sceneData.isMazeScene)
			{
				var proto : MazeDungeonProto = (sceneData.getData() as SceneProto).mazeDungeon;
				if (!proto)
					return;
				var portal : Array = proto.portalDatas;
				if (portal)
				{
					for (var i : int = 0; i < portal.length; i++)
					{
						var portalData : SceneTranportData = new SceneTranportData(RoleType.TYPE_TRANPORT_MAZE);
						portalData.setMazeProtocData(portal[i], i);
						SceneRoleManager.getInstance().createTranport(portalData);
					}
				}
			}
			AreaMapManager.updateTransportAreaMap();
		}
	}
}
