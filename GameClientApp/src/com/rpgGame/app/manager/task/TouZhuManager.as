package com.rpgGame.app.manager.task
{
	import com.rpgGame.app.manager.AvatarManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.collect.CollectManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.MainRoleSearchPathManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.sender.TouZhuSender;
	import com.rpgGame.app.utils.TimeData;
	import com.rpgGame.core.events.TouZhuEvent;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.cfg.task.TouZhuCfgData;
	import com.rpgGame.coreData.clientConfig.Q_scene_monster_area;
	import com.rpgGame.coreData.configEnum.EnumHintInfo;
	import com.rpgGame.coreData.info.task.PrizeInfo;
	import com.rpgGame.coreData.info.task.daily.TouZhuTaskData;
	import com.rpgGame.coreData.lang.LangTask;
	import com.rpgGame.coreData.role.HeroData;
	
	import flash.geom.Point;
	
	import app.message.MonsterDataProto;
	import app.message.TouZhuTaskProto;
	
	import org.client.mainCore.manager.EventManager;

	/**
	 * 偷猪
	 * @author luguozheng
	 *
	 */
	public class TouZhuManager
	{
		/** 当前偷猪数据 **/
		public static var touZhuTask : TouZhuTaskData;
		/** 活动开启时间 **/
		public static var touZhuTimeData : TimeData;
		/** 已经完成过的偷猪任务次数 **/
		public static var touZhuTimes : int;
		/** 进度条的结束时间 **/
		public static var touZhuEndTime : Number;


		/**
		 * 设置英雄数据
		 * @param miXinProto		偷猪任务，可能为空，为空表示没有任务
		 * @param miXinTime			已经完成过的偷猪任务次数
		 *
		 */
		public static function setHero(touZhuProto : TouZhuTaskProto, touzhuTimes : int) : void
		{
			touZhuTimes = touzhuTimes;

			if (touZhuProto == null)
				return;

			touZhuTask = new TouZhuTaskData();
			touZhuTask.setData(touZhuProto);

			EventManager.dispatchEvent(TouZhuEvent.START_TOU_ZHU);
		}

		/**
		 * 零点重置
		 *
		 */
		public static function resetDaily() : void
		{
			touZhuTimes = 0;
		}

		//-----------------------------------------
		/**
		 * 是否已经有偷猪任务
		 * @return
		 *
		 */
		public static function hasTouZhuTask() : Boolean
		{
			return touZhuTask != null;
		}

		/**
		 * 是否已经偷到猪了，抱在身上了，可以去完成任务了
		 * @param npcId
		 * @return
		 *
		 */
		public static function isCompleteTouZhu() : Boolean
		{
			if (touZhuTask == null)
				return false;

			if (touZhuTask.zhuId <= 0)
				return false;

			return true;
		}

		/**
		 * 是否是接受偷猪的ＮＰＣ
		 * @param npcId
		 * @return
		 *
		 */
		public static function isAccpetTouZhuNpc(npcId : int) : Boolean
		{
			return TouZhuCfgData.acceptNpc == npcId;
		}

		/**
		 * 是否是完成偷猪的ＮＰＣ
		 * @param npcId
		 * @return
		 *
		 */
		public static function isCompleteTouZhuNpc(npcId : int) : Boolean
		{
			return TouZhuCfgData.completeNpc == npcId;
		}

		/**
		 * 参加偷猪
		 *
		 */
		public static function gotoTouZhu() : void
		{
			var npcData : Q_scene_monster_area;
//			var isAtEnemyCountry : Boolean = CountryManager.isAtEnemyCountry();
//			var isMixComplete : Boolean = isCompleteTouZhu();
//
//			if (touZhuTask == null)
//			{
//				if (CountryManager.isAtMyCountry())
//				{
//					//在本国就去接任务
//					npcData = MonsterDataManager.getData(TouZhuCfgData.acceptNpc);
//				}
//				else
//				{
//					//非本国就去边境，然后回国
//					npcData = MonsterDataManager.getData(NpcCfgData.countryTransNPCId);
//				}
//			}
//			else
//			{
//				if (isAtEnemyCountry) //在别国的国家这时可以去找
//				{
//					//在敌国时
//					if (isMixComplete)
//					{
//						//已经完成就去边境，然后回国完成
//						npcData = MonsterDataManager.getData(NpcCfgData.countryTransNPCId);
//					}
//					else
//					{
//						//猪还没偷到，就去偷
//						var monsterID : int = TouZhuCfgData.getTouZhuId();
//						npcData = MonsterDataManager.getData(monsterID);
//						var position : Point = MonsterDataManager.getMonsterPosition(npcData);
//						if (position == null)
//							return;
//
//						var sceneId : int = MonsterDataManager.getMonsterSceneId(monsterID);
//
//						MainRoleSearchPathManager.walkToScene(sceneId, position.x, position.y, null, 200);
//						return;
//					}
//				}
//				else
//				{
//					//本国的
//					if (isMixComplete)
//					{
//						//本国
//						if (CountryManager.isAtMyCountry())
//						{
//							//完成的去交任务、到自己国家
//							npcData = MonsterDataManager.getData(TouZhuCfgData.completeNpc);
//						}
//						else
//						{
//							//在盟国，要回国
//							npcData = MonsterDataManager.getData(NpcCfgData.countryTransNPCId);
//						}
//					}
//					else
//					{
//						//还没交的，去边境出国
//						npcData = MonsterDataManager.getData(NpcCfgData.countryTransNPCId);
//					}
//				}
//			}

			if (npcData == null)
				return;

			var pos : Point = MonsterDataManager.getMonsterPosition(npcData);
			MainRoleSearchPathManager.walkToScene(npcData.q_mapid, pos.x, pos.y, null, 200);
		}

		public static function getTouZhuTime() : Date
		{
			if (touZhuTimeData == null)
				touZhuTimeData = new TimeData(TouZhuCfgData.timeData);
			return touZhuTimeData.getNextTime();
		}

		//--------------------------------------------------
		/**
		 * 上线检查是否有偷猪状态
		 *
		 */
		public static function checkTouZhuState() : void
		{
			if (touZhuTask == null)
				return;

			changeTouZhuStats(MainRoleManager.actor, touZhuTask.zhuId);
		}

		/**
		 * 改变换装
		 * @param atkor
		 * @param state
		 *
		 */
		public static function changeTouZhuStats(atkor : SceneRole, state : int) : void
		{
			if (atkor == null)
				return;

			var data : HeroData = atkor.data as HeroData;
			if (data == null)
				return;

//			if (state > 0)
//			{
//				//偷猪状态，偷到猪了
//				data.avatarInfo.bodyResID = "pc/an_suit_knife1_001/an_suit_knife1_001"; //测试
//				data.avatarInfo.weaponResID = "pc/an_suit_knife1_001/an_wq_knife_001"; //测试
//			}
//			else if (state == 0)
//			{
//				//偷猪状态，但是没有偷到猪
//				data.avatarInfo.bodyResID = "pc/an_suit_knife1_003/an_suit_knife1_002"; //测试
//				data.avatarInfo.weaponResID = "pc/an_suit_knife1_003/wq_st_badao_jesse"; //测试
//			}
//			else
//			{
//				//正常形态
//				data.avatarInfo.bodyResID = "pc/an_suit_knife1_002/an_suit_knife1_002"; //测试
//				data.avatarInfo.weaponResID = "pc/an_suit_knife1_002/wq_st_badao_jesse"; //测试
//			}

			//执行主换装更新
			AvatarManager.updateAvatar(atkor);
		}

		//---------------------------------

		public static function getCurTaskPrize() : PrizeInfo
		{
			if (!isCompleteTouZhu())
				return null;

			return TouZhuCfgData.getPrizeByZhuId(touZhuTask.zhuId);
		}

		public static function getQuality() : int
		{
			return TouZhuCfgData.getQuality(touZhuTask.zhuId);
		}

		//---------------------------------
		private static var touZhuMonsterId : Number;

		/**
		 * 申请开始偷猪
		 * varint64 猪在场景中的id
		 */
		public static function reqStratTouZhu(monsterId : Number) : void
		{
			if (touZhuTask == null)
			{
				NoticeManager.showHint(EnumHintInfo.STRAT_TOU_ZHU_FAIL2);
				return;
			}

			touZhuMonsterId = monsterId;

			TouZhuSender.reqStratTouZhu(monsterId);
		}

		public static function onRecStratTouZhu(collect : Number) : void
		{
			CollectManager.show(LanguageConfig.getText(LangTask.TOU_ZHU_COLLECT), collect, sendDoTouZhu)
		}

		private static function sendDoTouZhu(args : Array) : void
		{
			TouZhuSender.reqDoTouZhuTask(touZhuMonsterId);
		}

		/**
		 * 接受偷猪，并且自己寻路
		 *
		 */
		public static function reqAcceptTouZhuTask() : void
		{
			if (hasTouZhuTask())
			{
				gotoTouZhu();
				return;
			}

			TouZhuSender.reqAcceptTouZhuTask();
		}

	}
}
