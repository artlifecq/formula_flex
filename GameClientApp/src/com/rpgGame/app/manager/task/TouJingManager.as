package com.rpgGame.app.manager.task
{
	import com.rpgGame.app.cmdlistener.enum.EmQuality;
	import com.rpgGame.app.fight.spell.SpellAnimationHelper;
	import com.rpgGame.app.graphics.HeadFace;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.country.CountryManager;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.goods.ItemUseManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.MainRoleSearchPathManager;
	import com.rpgGame.app.manager.role.SceneRoleSelectManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.app.utils.TimeData;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.toujing.TouJingEvent;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.biao.BiaoCfgData;
	import com.rpgGame.coreData.cfg.item.ItemCfgData;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.cfg.npc.NpcCfgData;
	import com.rpgGame.coreData.cfg.task.TouJingCfgData;
	import com.rpgGame.coreData.enum.AlertClickTypeEnum;
	import com.rpgGame.coreData.info.SearchRoleData;
	import com.rpgGame.coreData.info.toujing.TouJingBookStateData;
	import com.rpgGame.coreData.info.toujing.TouJingPrizeInfo;
	import com.rpgGame.coreData.info.toujing.TouJingTaskData;
	import com.rpgGame.coreData.lang.LangTouJing;
	import com.rpgGame.coreData.lang.LangYunBiao;
	import com.rpgGame.coreData.role.MonsterData;
	import com.rpgGame.coreData.type.EffectUrl;
	import com.rpgGame.coreData.type.RenderUnitID;
	import com.rpgGame.coreData.type.RenderUnitType;
	import com.rpgGame.coreData.type.SceneCharType;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
	import flash.geom.Point;
	
	import app.message.MonsterDataProto;
	import app.message.TouJingTaskProto;
	import app.message.NpcDialogProto.NpcType;
	
	import org.client.mainCore.manager.EventManager;

	/**
	 * 偷经数据管理
	 * @author 陈鹉光
	 *
	 */
	public class TouJingManager
	{
		/** 做偷经任务需要的等级 **/
		public static const TOU_JING_NEED_LEVEL:int = int(LanguageConfig.getText( LangTouJing.TOU_JING_OPEN_LEVEL ));
		/** 偷经任务，可能为空，为空表示没有任务 **/
		public static var touJingData : TouJingTaskData;
		/** 偷经时间data **/
		private static var touJingTimeData : TimeData;
		/** 偷经次数 **/
		public static var touJingCount : int;
		/** 倒计时面板的倒计时是否结束 **/
		private static var isEnd : Boolean = true;
		/** 玩家当前经书的品质【5：灰色品质，是特殊品质，灰色经书】 **/
		public static var curJingShuQuality : int = -1;
		/** alertTittle **/
		private static var tittle:String = "";

		public function TouJingManager()
		{
		}

		/**
		 * 设置英雄数据
		 * @param TouJingTaskProto 偷经任务，可能为空，为空表示没有任务
		 * @param Count	已经完成过的偷经任务次数
		 *
		 */
		public static function setHero(touJingTask : TouJingTaskProto, Count : int) : void
		{
			touJingCount = Count;
			//偷经
			if (touJingTask == null)
				return;

			touJingData = new TouJingTaskData();
			touJingData.setData(touJingTask);
		}

		/**
		 * 零点重置
		 *
		 */
		public static function resetDaily() : void
		{
			touJingCount = 0;
		}

		/**
		 * 是否完成每日最大次数偷经任务
		 * @return
		 *
		 */
		public static function isToujingMax() : Boolean
		{
			return touJingCount >= TouJingCfgData.timesPerDay ? true : false;
		}

		/**
		 *  上线检查是否有偷经状态
		 *
		 */
		public static function checkTouJingState() : void
		{
			if (touJingData == null)
				return;

			if (touJingData.isTouSuccess) //偷到经书
			{
				curJingShuQuality = touJingData.quality;
				showJingHeroEffect(MainRoleManager.actor, curJingShuQuality);
			}
			else
			{
				if (touJingData.countryID != 0)
				{
					curJingShuQuality = EmQuality.QUALITY_GRAY;
					showJingHeroEffect(MainRoleManager.actor, curJingShuQuality);
					EventManager.dispatchEvent( TouJingEvent.TOUJING_CHECK_STATE );
				}
			}
		}

		/**
		 * 人物头顶经书品质显示
		 * @param atkor 场景角色
		 * @param quality 经书品质
		 *
		 */
		public static function showJingHeroEffect(atkor : SceneRole, quality : int) : void
		{
			if(atkor.headFace is HeadFace)
			{
				if (quality >= EmQuality.QUALITY_WHITE)
				{
					switch (quality)
					{
						case EmQuality.QUALITY_WHITE:
							(atkor.headFace as HeadFace).effectGroup.addEffect( RenderUnitID.TOU_JING, RenderUnitType.SCRIPTURES, EffectUrl.SCRIPTURES0 );
							break;
						case EmQuality.QUALITY_GREEN:
							(atkor.headFace as HeadFace).effectGroup.addEffect( RenderUnitID.TOU_JING, RenderUnitType.SCRIPTURES, EffectUrl.SCRIPTURES1 );
							break;
						case EmQuality.QUALITY_BLUE:
							(atkor.headFace as HeadFace).effectGroup.addEffect( RenderUnitID.TOU_JING, RenderUnitType.SCRIPTURES, EffectUrl.SCRIPTURES2 );
							break;
						case EmQuality.QUALITY_PURPLE:
							(atkor.headFace as HeadFace).effectGroup.addEffect( RenderUnitID.TOU_JING, RenderUnitType.SCRIPTURES, EffectUrl.SCRIPTURES3 );
							break;
						case EmQuality.QUALITY_ORANGE:
							(atkor.headFace as HeadFace).effectGroup.addEffect( RenderUnitID.TOU_JING, RenderUnitType.SCRIPTURES, EffectUrl.SCRIPTURES4 );
							break;
						case EmQuality.QUALITY_GRAY:
							(atkor.headFace as HeadFace).effectGroup.addEffect( RenderUnitID.TOU_JING, RenderUnitType.SCRIPTURES, EffectUrl.SCRIPTURES5 );
							break;
					}
				}
				else
				{
					(atkor.headFace as HeadFace).effectGroup.removeEffectById( RenderUnitID.TOU_JING, RenderUnitType.SCRIPTURES );
				}
			}
		}

		/**
		 * 是否完成偷经任务
		 * @return
		 *
		 */
		public static function isCompleteTouJing() : Boolean
		{
			if (touJingData == null)
				return false;

			if (!touJingData.isTouSuccess)
				return false;

			return true;
		}

		/**
		 * 是否有偷经任务
		 * @return
		 *
		 */
		public static function hasTouJingTask() : Boolean
		{
			return touJingData == null ? false : true;
		}

		/**
		 * 是否是偷经的npc
		 * @param npcId
		 * @return
		 *
		 */
		public static function isTouJingNpc(npcId : int) : Boolean
		{
			return NpcCfgData.isFunctionType(npcId, NpcType.ACCEPT_TOU_JING) || NpcCfgData.isFunctionType(npcId, NpcType.COMPLETE_TOU_JING) || NpcCfgData.isFunctionType(npcId, NpcType.DO_TOU_JING);
		}

		/**
		 * 获取偷经 下一个时间点
		 * @return
		 *
		 */
		public static function getTouJingTime() : Date
		{
			if (touJingTimeData == null)
				touJingTimeData = new TimeData(TouJingCfgData.timeData);
			return touJingTimeData.getNextTime();
		}

		/**
		 * 重新偷经倒计时是否结束
		 * @param bool
		 *
		 */
		public static function set touJingCDIsEnd(bool : Boolean) : void
		{
			isEnd = bool;
		}

		/**
		 * 倒计时是否结束
		 * @param bool
		 *
		 */
		public static function get touJingCDIsEnd() : Boolean
		{
			return isEnd;
		}

		/**
		 * 偷经成功,获得xxx品质经书提示
		 * @param quality 经书品质[ 0：白色, 1：绿, 2：蓝, 3：紫, 4：橙, 5：灰色，特殊品质 ]
		 *
		 */
		public static function touJingSucceed(quality : int) : void
		{
			curJingShuQuality = quality;
			if (curJingShuQuality != EmQuality.QUALITY_GRAY)
			{
				//成功偷得经文
				NoticeManager.showNotify(LangTouJing.TASK_TOUJING_COMPLETE);
			}
			//获得xxx品质经书提示
			getJingShuQuality(curJingShuQuality);
			
//			TouJingManager.showJingHeroEffect( MainRoleManager.actor, -1 );
//			//人物头顶经书品质显示
//			TouJingManager.showJingHeroEffect(MainRoleManager.actor, curJingShuQuality);
//			//偷经倒计时等待面板
//			AppManager.showApp( AppConstant.TOU_JING_CDPANEL );
		}

		/**
		 * 获取经书品质提示
		 * @param quality 经书品质[ 0：白色, 1：绿, 2：蓝, 3：紫, 4：橙, 5：灰色，特殊品质 ]
		 *
		 */
		public static function getJingShuQuality(quality : int) : void
		{
			switch (quality)
			{
				case EmQuality.QUALITY_WHITE:
					NoticeManager.showNotify(LangTouJing.TASK_TOUJING_QUALITY_WHITE);
					break;
				case EmQuality.QUALITY_GREEN:
					NoticeManager.showNotify(LangTouJing.TASK_TOUJING_QUALITY_GREEN);
					break;
				case EmQuality.QUALITY_BLUE:
					NoticeManager.showNotify(LangTouJing.TASK_TOUJING_QUALITY_BLUE);
					break;
				case EmQuality.QUALITY_PURPLE:
					NoticeManager.showNotify(LangTouJing.TASK_TOUJING_QUALITY_PURPLE);
					break;
				case EmQuality.QUALITY_ORANGE:
					NoticeManager.showNotify(LangTouJing.TASK_TOUJING_QUALITY_ORANGE);
					break;
				case EmQuality.QUALITY_GRAY:
					NoticeManager.showNotify(LangTouJing.TASK_TOUJING_QUALITY_NOT);
					break;
			}
		}

		/**
		 * 获取玩家头顶经书的品质颜色
		 * @param quality 经书品质[ 0：白色, 1：绿, 2：蓝, 3：紫, 4：橙, 5：灰色，特殊品质 ]
		 * @return strQuality
		 *
		 */
		public static function getJingShuColor(quality : int) : String
		{
			var strQualityName : String = "";
			switch (quality)
			{
				case EmQuality.QUALITY_WHITE:
					strQualityName = LanguageConfig.getText(LangTouJing.TOU_JING_QUALITY_WHITE);
					break;
				case EmQuality.QUALITY_GREEN:
					strQualityName = LanguageConfig.getText(LangTouJing.TOU_JING_QUALITY_GREEN);
					break;
				case EmQuality.QUALITY_BLUE:
					strQualityName = LanguageConfig.getText(LangTouJing.TOU_JING_QUALITY_BLUE);
					break;
				case EmQuality.QUALITY_PURPLE:
					strQualityName = LanguageConfig.getText(LangTouJing.TOU_JING_QUALITY_PURPLE);
					break;
				case EmQuality.QUALITY_ORANGE:
					strQualityName = LanguageConfig.getText(LangTouJing.TOU_JING_QUALITY_ORANGE);
					break;
				case EmQuality.QUALITY_GRAY:
					strQualityName = LanguageConfig.getText(LangTouJing.TOU_JING_QUALITY_GRAY);
					break;
				default:
					strQualityName = LanguageConfig.getText(LangTouJing.TOU_JING_QUALITY_NOT);
					break;
			}
			return strQualityName;
		}

		/**
		 * 通过国家id获取国家强弱的文字颜色
		 * @param countryId
		 * @return color
		 *
		 */
		public static function getColorByCountryId(countryId : uint) : uint
		{
			var arr:Array = CountryManager.countryJingShuArr;
			if( arr == null || arr.length <= 0 )
				return null;
			
			var inEmptyRate:Number = int( LanguageConfig.getText( LangTouJing.TOU_JING_RATE_1 ) ) / 100;
			var outEmptyRate:Number = int( LanguageConfig.getText( LangTouJing.TOU_JING_RATE_2 ) ) / 100;
			var inParamarthaRate:Number = int( LanguageConfig.getText( LangTouJing.TOU_JING_RATE_3 ) ) / 100;
			var outParamarthaRate:Number = int( LanguageConfig.getText( LangTouJing.TOU_JING_RATE_4 ) ) / 100;
			
			for (var idx : int = 0; idx < arr.length; idx++)
			{
				var data : TouJingBookStateData = arr[idx];
				if (countryId == data.countryId)
				{
					if( data.countryJingShu < (CountryManager.jingShuNum * inEmptyRate) )//劫空
					{
						return StaticValue.COLOR_CODE_23;
					}
					else if( data.countryJingShu > (CountryManager.jingShuNum * outEmptyRate) && data.countryJingShu < (CountryManager.jingShuNum * inParamarthaRate) )//普通
					{
						return StaticValue.COLOR_CODE_1;
					}
					else if( data.countryJingShu >= (CountryManager.jingShuNum * inParamarthaRate) )//真谛
					{
						return StaticValue.Q_YELLOW;
					}
					else if( data.countryJingShu < (CountryManager.jingShuNum * outParamarthaRate) && data.countryJingShu > (CountryManager.jingShuNum * outEmptyRate) )//普通
					{
						return StaticValue.COLOR_CODE_1;
					}
					else
					{
						//不在“劫空”/“真谛”状态  普通
						return StaticValue.COLOR_CODE_1;
					}
				}
			}
			return null;
		}

		/**
		 * 参加偷经
		 *
		 */
		public static function gotoTouJing() : void
		{
			var npcData : MonsterDataProto;
			if (isToujingMax())
			{
				NoticeManager.showNotify(LangTouJing.TASK_TOUJING_FAIL25);
				return;
			}

			if (touJingData == null)
			{
				if (CountryManager.isAtMyCountry())
				{
					//在本国就去接任务
					npcData = MonsterDataManager.getData(TouJingCfgData.acceptNpcID);
				}
				else
				{
					//非本国就去边境，然后回国
					npcData = MonsterDataManager.getData(NpcCfgData.countryTransNPCId);
				}
			}
			else
			{
				if (CountryManager.isAtEnemyCountry()) //在别国的国家这时可以去找
				{
					//在敌国时
					if (isCompleteTouJing())
					{
						//已经完成就去边境，然后回国完成
						npcData = MonsterDataManager.getData(NpcCfgData.countryTransNPCId);
					}
					else
					{
						//经书任务还没做，那么先去敌国做任务
						npcData = MonsterDataManager.getData(TouJingCfgData.submitNpcID);
					}
				}
				else
				{
					//在本国的、盟国的
					if (isCompleteTouJing())
					{
						//在本国
						if (CountryManager.isAtMyCountry())
						{
							//完成的去交任务、到自己国家
							npcData = MonsterDataManager.getData(TouJingCfgData.completeNpcID);
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
		 * 偷经各个品质的奖励tips 
		 * 
		 */		
		public static function getTouJingPrizeInfoTips():String
		{
			var str:String = "";
			var prizeInfo:TouJingPrizeInfo = TouJingCfgData.getTouJingPrizeByLevel( MainRoleManager.actorInfo.level );
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
				if( CountryManager.isInGuoYun )//是否在国运期间
					baseExp = baseExp * BiaoCfgData.miscData.guo_yun_exp_additional;
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
		 * npc护国寺需要增加分级特效 
		 * @param roleID 
		 * @param sceneRole 
		 * @param isInHorizon 是否在视野内
		 * 
		 */		
		public static function setHuGuoSiEffect( roleID:Number, sceneRole : SceneRole, isInHorizon:Boolean ):void
		{
			if( sceneRole == null )
				return;
			
			if( !TouJingManager.isTouJingNpc( roleID ) )
				return;
			
			var arr:Array = CountryManager.countryJingShuArr;
			if( arr == null || arr.length <= 0 )
				return;
			sceneRole.avatar.removeRenderUnitsByType( RenderUnitType.SCRIPTURES );
			var monsterData:MonsterData = sceneRole.data as MonsterData;
			var inEmptyRate:Number = int( LanguageConfig.getText( LangTouJing.TOU_JING_RATE_1 ) ) / 100;
			var outEmptyRate:Number = int( LanguageConfig.getText( LangTouJing.TOU_JING_RATE_2 ) ) / 100;
			var inParamarthaRate:Number = int( LanguageConfig.getText( LangTouJing.TOU_JING_RATE_3 ) ) / 100;
			var outParamarthaRate:Number = int( LanguageConfig.getText( LangTouJing.TOU_JING_RATE_4 ) ) / 100;
			var countryId:int = MainRoleManager.actorInfo.sceneSequence;
			
			for (var idx : int = 0; idx < arr.length; idx++)
			{
				var data : TouJingBookStateData = arr[idx];
				if (countryId == data.countryId)
				{
					if( data.countryJingShu < (CountryManager.jingShuNum * inEmptyRate) )//劫空
					{
						if( isInHorizon )
							SpellAnimationHelper.addTargetEffect( sceneRole, RenderUnitID.HU_GUO_SI_EMPTY, RenderUnitType.SCRIPTURES, EffectUrl.HU_GUO_SI_EMPTY_EFFECT, null, 0 );
						else
							sceneRole.avatar.removeRenderUnitsByType( RenderUnitType.SCRIPTURES );
						break;
					}
					else if( data.countryJingShu > (CountryManager.jingShuNum * outEmptyRate) && data.countryJingShu < (CountryManager.jingShuNum * inParamarthaRate) )//普通
					{
						if( isInHorizon )
							SpellAnimationHelper.addTargetEffect( sceneRole, RenderUnitID.HU_GUO_SI_GENERAL, RenderUnitType.SCRIPTURES, EffectUrl.HU_GUO_SI_GENERAL_EFFECT, null, 0 );
						else
							sceneRole.avatar.removeRenderUnitsByType( RenderUnitType.SCRIPTURES );
						break;
					}
					else if( data.countryJingShu >= (CountryManager.jingShuNum * inParamarthaRate) )//真谛
					{
						if( isInHorizon )
							SpellAnimationHelper.addTargetEffect( sceneRole, RenderUnitID.HU_GUO_SI_PARAMARTHA, RenderUnitType.SCRIPTURES, EffectUrl.HU_GUO_SI_PARAMARTHA_EFFECT, null, 0 );
						else
							sceneRole.avatar.removeRenderUnitsByType( RenderUnitType.SCRIPTURES );
						break;
					}
					else if( data.countryJingShu < (CountryManager.jingShuNum * outParamarthaRate) && data.countryJingShu > (CountryManager.jingShuNum * outEmptyRate) )//普通
					{
						if( isInHorizon )
							SpellAnimationHelper.addTargetEffect( sceneRole, RenderUnitID.HU_GUO_SI_GENERAL, RenderUnitType.SCRIPTURES, EffectUrl.HU_GUO_SI_GENERAL_EFFECT, null, 0 );
						else
							sceneRole.avatar.removeRenderUnitsByType( RenderUnitType.SCRIPTURES );
						break;
					}
					else
					{
						//不在“劫空”/“真谛”状态  普通
						if( isInHorizon )
							SpellAnimationHelper.addTargetEffect( sceneRole, RenderUnitID.HU_GUO_SI_GENERAL, RenderUnitType.SCRIPTURES, EffectUrl.HU_GUO_SI_GENERAL_EFFECT, null, 0 );
						else
							sceneRole.avatar.removeRenderUnitsByType( RenderUnitType.SCRIPTURES );
						break;
					}
				}
			}
		}
		
		/**
		 * 回本国王城 
		 * 
		 */		
		public static function returnMyCountry():void
		{
			//回城卷id
			var itemId:int = int(LanguageConfig.getText( LangTouJing.TOU_JING_HUI_CHENG_ITEM_ID ));
			var count:int = BackPackManager.instance.getItemCount(itemId);
			if( count <= 0 )
				tittle = HtmlTextUtil.getTextColor(StaticValue.COLOR_CODE_13,ItemCfgData.getItemName(itemId));
			else
				tittle = HtmlTextUtil.getTextColor(StaticValue.COLOR_CODE_15,ItemCfgData.getItemName(itemId));
			GameAlert.showAlertUtil( LangTouJing.TOU_JING_HUI_CHENG_DESC, onCheckClickBtn, tittle );
		}
		
		/**
		 *  点击按钮检测
		 *
		 */
		private static function onCheckClickBtn(gameAlert:GameAlert) : void
		{
			switch( gameAlert.clickType )
			{
				case AlertClickTypeEnum.TYPE_SURE:
					//回城卷id
					var itemId:int = int(LanguageConfig.getText( LangTouJing.TOU_JING_HUI_CHENG_ITEM_ID ));
					var count:int = BackPackManager.instance.getItemCount(itemId);
					if( count <= 0 )//背包没该物品
					{
						NoticeManager.showNotify( LangTouJing.TOU_JING_HUI_CHENG_FAIL, HtmlTextUtil.getTextColor(StaticValue.COLOR_CODE_15,ItemCfgData.getItemName(itemId)) );
						
						//下面是物品不够自动购买，策划说暂时不需要
//						var info:AmountInfo = MainRoleManager.actorInfo.amountInfo;
//						var spellPrice:int = ItemCfgData.getItemSellPrice( itemId );
//						if( info.getAmountByType(AmountType.MONEY) >= spellPrice )//钱足够，自动购买一个回城卷
//						{
//							ShopSender.reqBuyJinziShopGoods( AmountType.MONEY, itemId, 1 );
//							ItemUseManager.useItemById( itemId, 1 );
//						}
//						else
//						{
//							NoticeManager.showNotify( LangEquip.GENERAL_FAIL_7 );
//						}
					}
					else
					{
						ItemUseManager.useItemById( itemId, 1 );
					}
					break;
				case AlertClickTypeEnum.TYPE_CANCEL:
				case AlertClickTypeEnum.TYPE_CLOSE:
					GameAlert.closeAlert( tittle );
					break;
				default:
					break;
			}
		}
	}
}
