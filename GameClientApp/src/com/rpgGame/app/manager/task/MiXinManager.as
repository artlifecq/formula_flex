package com.rpgGame.app.manager.task
{
	import com.rpgGame.app.cmdlistener.enum.EmQuality;
	import com.rpgGame.app.graphics.HeadFace;
	import com.rpgGame.app.manager.country.CountryManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.MainRoleSearchPathManager;
	import com.rpgGame.app.manager.role.SceneRoleSelectManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.sender.MiXinSender;
	import com.rpgGame.app.utils.TimeData;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.cfg.npc.NpcCfgData;
	import com.rpgGame.coreData.cfg.task.MiXinCfgData;
	import com.rpgGame.coreData.info.SearchRoleData;
	import com.rpgGame.coreData.info.country.country.CountryData;
	import com.rpgGame.coreData.info.roulette.RouletteInfo;
	import com.rpgGame.coreData.info.task.MiXinPrizeInfo;
	import com.rpgGame.coreData.info.task.daily.MiXinTaskData;
	import com.rpgGame.coreData.lang.LangYunBiao;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.role.MonsterData;
	import com.rpgGame.coreData.type.EffectUrl;
	import com.rpgGame.coreData.type.RenderUnitID;
	import com.rpgGame.coreData.type.RenderUnitType;
	import com.rpgGame.coreData.type.SceneCharType;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
	import flash.geom.Point;
	
	import app.message.MiXinTaskProto;
	import app.message.MonsterDataProto;
	import app.message.NpcDialogProto.NpcType;
	
	import utils.TimerServer;

	/**
	 * 鸡毛信管理器 
	 * @author 陈鹉光
	 * 
	 */	
	public class MiXinManager
	{
		/** cd时间 **/
		private static var cdTime : int;
		/** 变到下一个的时间间隔，时间越长表示速度越慢 **/
		/** 减速时间 **/
		private static const SlowdownTime : int = 200;
		/** 加速时间 **/
		private static const SpeedupTime : int = 20;
		/** 因素 **/
		private static const factor : int = 10;
		/** 时间间隔 **/
		private static var timeGap : int;
		/** 密信任务，可能为空，为空表示没有任务 **/
		public static var mixinTask : MiXinTaskData;
		/** 已经完成过的密信任务次数  **/
		public static var miXinTimes : int;
		/** 活动开启时间 **/
		public static var miXinTimeData : TimeData;
		/**转盘奖励**/
		public static var rouletteInfo : RouletteInfo;
		/** 倒计时面板的倒计时是否结束 **/
		private static var isEnd : Boolean = true;
		/** 换一封鸡毛信倒计时是否结束 **/
		private static var _jiMaoXinIsEnd : Boolean = true;

		public function MiXinManager()
		{
			
		}
		
		/**
		 * 设置英雄数据
		 * @param miXinProto		密信任务，可能为空，为空表示没有任务
		 * @param miXinTime			已经完成过的密信任务次数
		 *
		 */
		public static function setHero(miXinProto : MiXinTaskProto, miXinTime : int) : void
		{
			miXinTimes = miXinTime;

			if (miXinProto == null)
				return;

			mixinTask = new MiXinTaskData();
			mixinTask.setData(miXinProto);
		}

		/**
		 * 任务清零 
		 * 
		 */		
		public static function resetDaily() : void
		{
			miXinTimes = 0;
		}

		/**
		 * 是否有密信任务
		 * @return
		 *
		 */
		public static function hasMixinTask() : Boolean
		{
			return mixinTask != null;
		}

		/**
		 * 是否完成每日最大次数密信任务
		 * @return
		 *
		 */
		public static function isMixinMax() : Boolean
		{
			return miXinTimes >= MiXinCfgData.timesPerDay ? true : false;
		}

		/**
		 * 是否提交密信（接-提交-完成）
		 * @param npcId
		 * @return
		 *
		 */
		public static function isSubmitMiXinTask() : Boolean
		{
			if (mixinTask == null)
				return false;

			return mixinTask.quality >= 0;
		}

		/**
		 * 是否是接受密信的ＮＰＣ
		 * @param npcId
		 * @return
		 *
		 */
		public static function isAccpetMiXinNpc(npcId : int) : Boolean
		{
			return NpcCfgData.isFunctionType(npcId, NpcType.ACCEPT_MIXIN);
		}

		/**
		 * 是否是刷新密信的ＮＰＣ
		 * @param npcId
		 * @return
		 *
		 */
		public static function isSubmitMiXinNpc(npcId : int) : Boolean
		{
			//弱国的时候有两个狗娃   任何一个狗娃都可以交密信
			return NpcCfgData.isFunctionType(npcId, NpcType.REFRESH_MIXIN) || NpcCfgData.isFunctionType(npcId, NpcType.REFRESH_WEAK_MIXIN);
		}

		/**
		 * 是否是完成密信的ＮＰＣ
		 * @param npcId
		 * @return
		 *
		 */
		public static function isCompleteMiXinNpc(npcId : int) : Boolean
		{
			return NpcCfgData.isFunctionType(npcId, NpcType.COMPLETE_MIXIN);
		}

		/**
		 * 是否是领取密信的转盘奖励
		 *
		 */
		public static function isCollectedRoulettePrize() : Boolean
		{
			return rouletteInfo && rouletteInfo.isCollectedPrize;
		}

		/**
		 * 是否是做鸡毛信的目标国家
		 *
		 */
		public static function isMiXinTargetCountry() : Boolean
		{
			var countryData : CountryData = CountryManager.selfCountryData;
			if (countryData == null)
				return false;

			return MainRoleManager.actorInfo.sceneSequence == countryData.strategy.miXinTargetCountry;
		}

		/**
		 * 密信任务
		 * 先去边镜，然后去别国
		 *
		 */
		public static function gotoMiXin() : void
		{
			var npcData : MonsterDataProto;
			var isAtEnemyCountry : Boolean = CountryManager.isAtEnemyCountry();
			var isMixComplete : Boolean = isSubmitMiXinTask();

			if (mixinTask == null)
			{
				if (CountryManager.isAtMyCountry())
				{
					//在本国就去接任务
					npcData = MonsterDataManager.getData(MiXinCfgData.acceptNpc);
				}
				else
				{
					//非本国就去边境，然后回国
					npcData = MonsterDataManager.getData(NpcCfgData.countryTransNPCId);
				}
			}
			else
			{
				if (isAtEnemyCountry) //在别国的国家这时可以去找
				{
					//在敌国时
					if (isMixComplete)
					{
						//已经完成就去边境，然后回国完成
						npcData = MonsterDataManager.getData(NpcCfgData.countryTransNPCId);
					}
					else
					{
						//信还没有交，那么先去敌国交任务
						npcData = MonsterDataManager.getData(MiXinCfgData.submitNpc);
					}
				}
				else
				{
					//在本国的、盟国的
					if (isMixComplete)
					{
						//在本国
						if (CountryManager.isAtMyCountry())
						{
							//完成的去交任务、到自己国家
							npcData = MonsterDataManager.getData(MiXinCfgData.completeNpc);
						}
						else
						{
							//在盟国的
							npcData = MonsterDataManager.getData(NpcCfgData.countryTransNPCId);
						}
					}
					else
					{
						//还没交的，去边境出国
						npcData = MonsterDataManager.getData(NpcCfgData.countryTransNPCId);
					}
				}
			}

			if (npcData == null)
				return;

			var sceneRole : SceneRole = SceneManager.getSceneNpcByModelId(npcData.id);
			var searchRoleData : SearchRoleData = new SearchRoleData();
			searchRoleData.searchId = npcData.id;
			searchRoleData.targetData = (sceneRole ? sceneRole.data as MonsterData : null);
			var pos : Point = MonsterDataManager.getMonsterPosition(npcData);
			MainRoleSearchPathManager.walkToScene(npcData.sceneId, pos.x, pos.y, function openPanel() : void
			{
				var targerId : Number = (searchRoleData.targetData ? searchRoleData.targetData.id : 0);
				var role : SceneRole = SceneManager.getScene().getSceneObjByID(targerId, SceneCharType.NPC) as SceneRole;
				SceneRoleSelectManager.selectedRole = role;
				AppManager.showAppNoHide(AppConstant.TASK_DIAILOG_FUNC_PANEL, targerId);
			}, 200, searchRoleData);
		}

		/**
		 * 下一次换取鸡毛信的时间 
		 * @return 
		 * 
		 */		
		public static function lastNextRefreshTime() : Number
		{
			if (mixinTask == null)
				return 0;

			return mixinTask.nextRandomMiXinTime - SystemTimeManager.curtTm;
		}
		
		/**
		 * 获取接受鸡毛信任务奖励tips 
		 * @return 
		 * 
		 */		
		public static function getAcceptMiXinPrizeInfoTips():String
		{
			var str:String = "";
			var prizeInfo:MiXinPrizeInfo = MiXinCfgData.getMiXinPrizeByLevel( MainRoleManager.actorInfo.level );
			if( prizeInfo == null )
				return str;
			
			var normalExpArr:Array = prizeInfo.normalExpMulitple;
			if( normalExpArr == null || normalExpArr.length <= 0 )
				return str;
			
			var baseExp:int = prizeInfo.baseExp;
			for (var i:int = 0; i < normalExpArr.length; i++) 
			{
				//经验奖励 EXP
				var normalExpRate:Number = normalExpArr[ i ];
				var rate:Number = Number( normalExpRate.toFixed(1) );
				var expValue:int = baseExp * rate;
				
				switch(i)
				{
					case EmQuality.QUALITY_WHITE://白
						if( expValue > 0 )
							str += HtmlTextUtil.getTextColor( StaticValue.Q_WHITE, LanguageConfig.getText( LangYunBiao.YUN_BIAO_Q_WHITE ) ) + HtmlTextUtil.getTextColor( StaticValue.Q_WHITE, expValue + "<br/>");
						break;
					case  EmQuality.QUALITY_GREEN://绿
						if( expValue > 0 )
							str += HtmlTextUtil.getTextColor( StaticValue.Q_GREEN, LanguageConfig.getText( LangYunBiao.YUN_BIAO_Q_GREEN ) ) + HtmlTextUtil.getTextColor( StaticValue.Q_WHITE, expValue + "<br/>");
						break;
					case  EmQuality.QUALITY_BLUE://蓝
						if( expValue > 0 )
							str += HtmlTextUtil.getTextColor( StaticValue.Q_BLUE, LanguageConfig.getText( LangYunBiao.YUN_BIAO_Q_BLUE ) ) + HtmlTextUtil.getTextColor( StaticValue.Q_WHITE, expValue + "<br/>");
						break;
					case  EmQuality.QUALITY_PURPLE://紫
						if( expValue > 0 )
							str += HtmlTextUtil.getTextColor( StaticValue.Q_PURPLE, LanguageConfig.getText( LangYunBiao.YUN_BIAO_Q_PURPLE ) ) + HtmlTextUtil.getTextColor( StaticValue.Q_WHITE, expValue + "<br/>");
						break;
					case  EmQuality.QUALITY_ORANGE://橙
						if( expValue > 0 )
							str += HtmlTextUtil.getTextColor( StaticValue.Q_YELLOW, LanguageConfig.getText( LangYunBiao.YUN_BIAO_Q_YELLOW ) ) + HtmlTextUtil.getTextColor( StaticValue.Q_WHITE, expValue + "" );
						break;
					default:
						break;
				}
			}
			return str;
		}

		/**
		 * 接受密信并且自动寻路
		 *
		 */
		public static function reqAcceptMixin() : void
		{
			if (hasMixinTask())
				gotoMiXin();
		}

		/**
		 * 放弃密信任务
		 *
		 */
		public static function giveUpMixin() : void
		{
			MiXinSender.giveUpMixin();
		}

		/**
		 *  上线检查是否有密信状态
		 *
		 */
		public static function checkMiXinState() : void
		{
			if (mixinTask == null)
				return;

			if (mixinTask.isSubmit) //偷到经书
				showMiXinHeroEffect(MainRoleManager.actor, mixinTask.quality);
			else
				showMiXinHeroEffect(MainRoleManager.actor, -1);
		}

		/**
		 * 人物头顶鸡毛信品质显示
		 * @param quality
		 *
		 */
		public static function showMiXinHeroEffect(atkor : SceneRole, quality : int) : void
		{
			if(atkor.headFace is HeadFace)
			{
				if (quality >= EmQuality.QUALITY_WHITE)
				{
					switch (quality)
					{
						case EmQuality.QUALITY_WHITE:
							(atkor.headFace as HeadFace).effectGroup.addEffect( RenderUnitID.JI_MAO_XIN, RenderUnitType.SCRIPTURES, EffectUrl.EFFECTUIL_JIMAOXIN_BAI );
							break;
						case EmQuality.QUALITY_GREEN:
							(atkor.headFace as HeadFace).effectGroup.addEffect( RenderUnitID.JI_MAO_XIN, RenderUnitType.SCRIPTURES, EffectUrl.EFFECTUIL_JIMAOXIN_LV );
							break;
						case EmQuality.QUALITY_BLUE:
							(atkor.headFace as HeadFace).effectGroup.addEffect( RenderUnitID.JI_MAO_XIN, RenderUnitType.SCRIPTURES, EffectUrl.EFFECTUIL_JIMAOXIN_LAN );
							break;
						case EmQuality.QUALITY_PURPLE:
							(atkor.headFace as HeadFace).effectGroup.addEffect( RenderUnitID.JI_MAO_XIN, RenderUnitType.SCRIPTURES, EffectUrl.EFFECTUIL_JIMAOXIN_ZI );
							break;
						case EmQuality.QUALITY_ORANGE:
							(atkor.headFace as HeadFace).effectGroup.addEffect( RenderUnitID.JI_MAO_XIN, RenderUnitType.SCRIPTURES, EffectUrl.EFFECTUIL_JIMAOXIN_CHENG );
							break;
					}
				}
				else
				{
					(atkor.headFace as HeadFace).effectGroup.removeEffectById( RenderUnitID.JI_MAO_XIN, RenderUnitType.SCRIPTURES );
				}
			}
		}
		
		///---------------------------------人物偷经鸡毛信特效延迟显示--------------------------------
		/**
		 * 人物头顶鸡毛信延迟显示
		 * @param atkor
		 * @param quality
		 * 
		 */		
		public static function delayShowEffect( atkor:SceneRole, quality:int ):void
		{
			var heroData:HeroData = atkor.data as HeroData;
			if( heroData != null )
			{
				if( heroData.id == MainRoleManager.actorID )//是自己的话就延迟显示鸡毛信头顶特效
				{
					startRoll(atkor, quality);
				}
				else
				{
					//其他场景玩家直接显示
					MiXinManager.showMiXinHeroEffect( atkor, -1 );
					MiXinManager.showMiXinHeroEffect( atkor, quality );
				}
			}
		}
		
		/**
		 * 开始跑马灯 
		 * @param atkor 玩家自己
		 * @param quality 鸡毛信品质
		 * 
		 */		
		private static function startRoll(atkor:SceneRole, quality:int) : void
		{
			timeGap = SlowdownTime;
			TimerServer.addLoop(speedUp, SlowdownTime, [atkor, quality]);
		}
		
		/**
		 * 停止跑马灯
		 * @param atkor 玩家自己
		 * @param quality 鸡毛信品质
		 * 
		 */
		private static function stopRoll(atkor:SceneRole, quality:int) : void
		{
			MiXinManager.showMiXinHeroEffect( atkor, -1 );
			MiXinManager.showMiXinHeroEffect( atkor, quality );
			TimerServer.remove(speedUp);
			TimerServer.remove(slowDown);
		}
		
		/**
		 * 加速
		 * @param atkor 玩家自己
		 * @param quality 鸡毛信品质
		 *
		 */
		private static function speedUp(atkor:SceneRole, quality:int) : void
		{
			if (timeGap <= SpeedupTime)
			{
				timeGap = SpeedupTime;
				TimerServer.remove(speedUp);
				TimerServer.addLoop(slowDown, timeGap, [atkor, quality]);
			}
			else
			{
				timeGap = timeGap - factor;
				TimerServer.edit(speedUp, timeGap, [atkor, quality]);
			}
		}
		
		/**
		 * 减速
		 * @param atkor 玩家自己
		 * @param quality 鸡毛信品质 
		 *
		 */
		private static function slowDown(atkor:SceneRole, quality:int) : void
		{
			if (timeGap >= SlowdownTime)
			{
				stopRoll(atkor, quality);
				return;
			}
			else
			{
				timeGap = timeGap + factor;
				TimerServer.edit(slowDown, timeGap, [atkor, quality]);
			}
		}

		///-----------------------------------------------------------------
		/**
		 * 重新偷经倒计时是否结束
		 * @param bool
		 *
		 */
		public static function setMiXinCDIsEnd(bool : Boolean) : void
		{
			isEnd = bool;
		}

		/**
		 * 倒计时是否结束
		 * @param bool
		 *
		 */
		public static function getMiXinCDIsEnd() : Boolean
		{
			return isEnd;
		}

		/** 换一封鸡毛信倒计时是否结束 **/
		public static function get jiMaoXinIsEnd():Boolean
		{
			return _jiMaoXinIsEnd;
		}

		/**
		 * @private
		 */
		public static function set jiMaoXinIsEnd(value:Boolean):void
		{
			_jiMaoXinIsEnd = value;
		}

	}
}
