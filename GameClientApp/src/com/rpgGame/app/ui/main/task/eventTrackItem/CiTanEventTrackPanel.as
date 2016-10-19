package com.rpgGame.app.ui.main.task.eventTrackItem
{
	import com.rpgGame.app.cmdlistener.enum.EmQuality;
	import com.rpgGame.app.manager.country.CountryManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.MainRoleSearchPathManager;
	import com.rpgGame.app.manager.role.SceneRoleSelectManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.manager.task.MiXinManager;
	import com.rpgGame.app.manager.task.TouJingManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.TaskEvent;
	import com.rpgGame.core.events.country.CountryEvent;
	import com.rpgGame.core.events.toujing.TouJingEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.country.CountryNameCfgData;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.cfg.npc.NpcCfgData;
	import com.rpgGame.coreData.cfg.task.MiXinCfgData;
	import com.rpgGame.coreData.info.SearchRoleData;
	import com.rpgGame.coreData.info.country.country.CountryData;
	import com.rpgGame.coreData.lang.LangJiMaoXin;
	import com.rpgGame.coreData.lang.LangText;
	import com.rpgGame.coreData.role.MonsterData;
	import com.rpgGame.coreData.type.SceneCharType;
	
	import flash.geom.Point;
	
	import app.message.MonsterDataProto;
	
	import gs.TweenLite;
	import gs.easing.Linear;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.dailyTaskEventTrack.trackItem.CiTanEventTrackSkin;
	
	import starling.display.DisplayObject;
	import starling.display.Shape;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	import utils.TimerServer;

	/**
	 * 刺探标签页
	 * @author 陈鹉光
	 *
	 */
	public class CiTanEventTrackPanel extends SkinUI
	{
		private var _skin : CiTanEventTrackSkin;
		/** cd时间 **/
		private var cdTime : int;
//		/** lable原来的Y坐标  **/
//		private var originalPoint1Y : Number;
//		/** lable原来的Y坐标  **/
//		private var originalPoint2Y : Number;
		/** 变到下一个的时间间隔，时间越长表示速度越慢 **/
		/** 减速时间 **/
		private const SlowdownTime : int = 200;
		/** 加速时间 **/
		private const SpeedupTime : int = 20;
		/** 因素 **/
		private const factor : int = 10;
		/** 时间间隔 **/
		private var timeGap : int;
		/** 原来的宽度 **/
		private static const IMG_WIDTH : Number = 120;
		/** 背景 **/
		private var _shape1:Shape;
		/** 背景 **/
		private var _shape2:Shape;

		public function CiTanEventTrackPanel()
		{
			_skin = new CiTanEventTrackSkin();
			super(_skin);
			init();
		}

		private function init() : void
		{
			_skin.labCountDown.htmlText = LanguageConfig.getText(LangJiMaoXin.MI_XIN_HAS_YET_TO_RETURN_FOR);
			_skin.btnGiveUp.visible = false;//策划说去掉鸡毛信放弃功能  2016-05-09 
//			originalPoint1Y = _skin.labPoint1.y;
//			originalPoint2Y = _skin.labPoint2.y;
			
			
			//背景
			_shape1 = new Shape();
			_shape1.graphics.clear();
			_shape1.graphics.beginFill(StaticValue.COLOR_CODE_23, 0.5);
			_shape1.graphics.drawRect(_skin.img0.x, _skin.img0.y, _skin.img0.width, _skin.img0.height);
			_shape1.graphics.endFill();
			addChildAt( _shape1, 0 );
			_skin.img0.visible = false;
			
			_shape2 = new Shape();
			_shape2.graphics.clear();
			_shape2.graphics.beginFill(StaticValue.COLOR_CODE_23, 0.5);
			_shape2.graphics.drawRect(_skin.img1.x, _skin.img1.y, _skin.img1.width, _skin.img1.height);
			_shape2.graphics.endFill();
			addChildAt( _shape2, 0 );
			_skin.img1.visible = false;
			

			EventManager.addEvent(TouJingEvent.MIXIN_ACCEPT_TASK, onUpdateNpcInfo);
			EventManager.addEvent(TaskEvent.MIXIN_COMPLETED_SUCCES, onUpdateNpcInfo);
			EventManager.addEvent(TaskEvent.MIXIN_REFRESH_SUCCES, startRoll);
		}

		/**
		 *当面板显示时,给子类处理自身逻辑
		 */
		override protected function onShow() : void
		{
			onUpdateNpcInfo();
			onUpdateQulity();
			EventManager.addEvent(CountryEvent.COUNTRY_DATA_ONLINE, onUpdateNpcInfo);
			EventManager.addEvent(TouJingEvent.MIXIN_ACCEPT_TASK, onUpdateNpcInfo);
			EventManager.addEvent(TaskEvent.MIXIN_COMPLETED_SUCCES, onUpdateNpcInfo);
			EventManager.addEvent(TaskEvent.MIXIN_REFRESH_SUCCES, startRoll);

			_skin.labPoint1.addEventListener(TouchEvent.TOUCH, onAcceptLabTouch);
			_skin.labPoint2.addEventListener(TouchEvent.TOUCH, onSubmitLabTouch);
		}

//		/**
//		 *当面板显示时,给子类处理自身逻辑
//		 */	
//		override protected function onShow():void
//		{
//			EventManager.addEvent( CountryEvent.COUNTRY_DATA_ONLINE, onUpdateNpcInfo );
//			EventManager.addEvent( TouJingEvent.MIXIN_ACCEPT_TASK, onUpdateNpcInfo );
//			EventManager.addEvent( TaskEvent.MIXIN_COMPLETED_SUCCES, onUpdateNpcInfo );
//			EventManager.addEvent( TaskEvent.MIXIN_REFRESH_SUCCES,startRoll );
//			
//			_skin.labPoint1.addEventListener( TouchEvent.TOUCH, onAcceptLabTouch );
//			_skin.labPoint2.addEventListener( TouchEvent.TOUCH, onSubmitLabTouch );
//		}
//		
//		/**
//		 *被动方法,当SkinUI子类实例从显示列表移除后会被调用
//		 */	
//		override protected function onHide():void
//		{
//			EventManager.removeEvent( CountryEvent.COUNTRY_DATA_ONLINE, onUpdateNpcInfo );
//			EventManager.removeEvent( TouJingEvent.MIXIN_ACCEPT_TASK, onUpdateNpcInfo );
//			EventManager.removeEvent( TaskEvent.MIXIN_COMPLETED_SUCCES, onUpdateNpcInfo );
//			EventManager.removeEvent( TaskEvent.MIXIN_REFRESH_SUCCES,startRoll );
//			
//			_skin.labPoint1.removeEventListener( TouchEvent.TOUCH, onAcceptLabTouch );
//			_skin.labPoint2.removeEventListener( TouchEvent.TOUCH, onSubmitLabTouch );
//		}

		/**
		 * 更新密信NPC位置信息
		 *
		 */
		private function onUpdateNpcInfo(type : int = 0) : void
		{
			if (MiXinCfgData == null)
				return;

			var npcData : MonsterDataProto; //npcProto数据
			var countryName : String; //国家名字
//			var miXinTargetCountryData : CountryData; //密信目标国家
			var countryData : CountryData = CountryManager.selfCountryData; //自己国家数据
			
			if( countryData == null ) return;

			if (countryData != null)
			{
				countryName = CountryNameCfgData.getCountryNameById(countryData.strategy.miXinTargetCountry);
//				miXinTargetCountryData = CountryManager.getCountryData(countryData.strategy.miXinTargetCountry);
			}

//			if (miXinTargetCountryData == null)
//				return;

			if (!countryName)
				countryName = "";

			if (MiXinManager.mixinTask != null && !MiXinManager.mixinTask.isSubmit) //有任务，并且还没换取到鸡毛信
			{
				_skin.labTittle.htmlText = LanguageConfig.getText(LangJiMaoXin.MI_XIN_EVENTTRACK_TITLE_1);
				if ( countryData.isWeakCountry ) //自己国家是弱国
				{
					//-------------------标识NPC2位置  阳平关狗娃--------------------------//
					_skin.labPoint2.visible = true;
					_skin.labTxt2.visible = true;
					npcData = MonsterDataManager.getData(MiXinCfgData.weakRefleshNpc);
					if (npcData == null)
						return;

					_skin.labPoint2.htmlText = countryName + " " + npcData.name;
					_skin.labTxt2.htmlText = LanguageConfig.getText(LangJiMaoXin.MI_XIN_TASK_JI_MAO_XIN_1);
					_skin.labPoint1.visible = false;
					_skin.labTxt1.visible = false;
				}
				else
				{
					//-------------------标识NPC1位置  狗娃--------------------------//
					npcData = MonsterDataManager.getData(MiXinCfgData.submitNpc);
					if (npcData == null)
						return;

					_skin.labPoint1.htmlText = countryName + " " + npcData.name;
					_skin.labTxt1.htmlText = LanguageConfig.getText(LangJiMaoXin.MI_XIN_TASK_JI_MAO_XIN_1);
					_skin.labPoint2.visible = false;
					_skin.labTxt2.visible = false;
				}
				_skin.btnReturn.visible = false;
				_skin.labDesc.htmlText = LanguageConfig.getText(LangJiMaoXin.MI_XIN_EVENTTRACK_DESC_1);
			}
			else
			{
				_skin.labTittle.htmlText = LanguageConfig.getText(LangJiMaoXin.MI_XIN_EVENTTRACK_TITLE_2);
				//-------------------接任务NPC位置   海娃--------------------------//
				npcData = MonsterDataManager.getData(MiXinCfgData.acceptNpc);
				if (npcData == null)
					return;

				countryName = CountryNameCfgData.getCountryNameById(MainRoleManager.actorInfo.countryId);
				if (!countryName)
					countryName = "";

				_skin.labTxt1.visible = true;
				_skin.labPoint1.visible = true;
				_skin.labTxt1.htmlText = LanguageConfig.getText(LangJiMaoXin.MI_XIN_IN_TASK);
				_skin.labPoint1.htmlText = countryName + " " + npcData.name;

				if ( countryData.isWeakCountry ) //自己国家是弱国
					npcData = MonsterDataManager.getData(MiXinCfgData.weakRefleshNpc);//标识NPC2位置  阳平关狗娃    弱国
				else
					npcData = MonsterDataManager.getData(MiXinCfgData.submitNpc);//标识NPC1位置  狗娃    强国

				if (npcData == null)
					return;

				countryName = CountryNameCfgData.getCountryNameById(countryData.strategy.miXinTargetCountry);
				if (!countryName)
					countryName = "";

				_skin.labTxt2.visible = true;
				_skin.labPoint2.visible = true;
				_skin.labTxt2.htmlText = LanguageConfig.getText(LangJiMaoXin.MI_XIN_TASK_JI_MAO_XIN_2);
				_skin.labPoint2.htmlText = countryName + " " + npcData.name;
				_skin.btnReturn.visible = true;
				_skin.labDesc.htmlText = LanguageConfig.getText(LangJiMaoXin.MI_XIN_EVENTTRACK_DESC_2);
			}
		}

		/**
		 * 品质
		 *
		 */
		private function onUpdateQulity(type : int = 0) : void
		{
			var quality : int = -1;
			if (MiXinManager.hasMixinTask())
			{
				if (MiXinManager.mixinTask != null && MiXinManager.mixinTask.isSubmit)
					_skin.labMiXinQulity.htmlText = TouJingManager.getJingShuColor(MiXinManager.mixinTask.quality);
				else
					_skin.labMiXinQulity.htmlText = TouJingManager.getJingShuColor(quality);
			}
			else
			{
				_skin.labMiXinQulity.htmlText = TouJingManager.getJingShuColor(quality);
			}
			cdBtnTime();
		}

		/**
		 * 开始跑马灯
		 *
		 */
		private function startRoll() : void
		{
			timeGap = SlowdownTime;
			TimerServer.addLoop(speedUp, SlowdownTime);
		}

		/**
		 * 停止跑马灯
		 *
		 */
		private function stopRoll() : void
		{
			TimerServer.remove(speedUp);
			TimerServer.remove(slowDown);
		}

		/**
		 * 开始按钮cd
		 *
		 */
		private function startCdBtn() : void
		{
			onUpdateQulity();
			cdTime = MiXinManager.lastNextRefreshTime() / 1000 + 5;
			TimerServer.addSecTick(cdBtnTime);
		}

		/**
		 * 加速
		 *
		 */
		private function speedUp() : void
		{
			if (timeGap <= SpeedupTime)
			{
				timeGap = SpeedupTime;
				TimerServer.remove(speedUp);
				TimerServer.addLoop(slowDown, timeGap);
			}
			else
			{
				timeGap = timeGap - factor;
				TimerServer.edit(speedUp, timeGap);
			}
		}

		/**
		 * 减速
		 *
		 */
		private function slowDown() : void
		{
			if (timeGap >= SlowdownTime)
			{
				stopRoll();
				startCdBtn();
				onUpdateNpcInfo();
				return;
			}
			else
			{
				timeGap = timeGap + factor;
				TimerServer.edit(slowDown, timeGap);
			}
		}

		/**
		 * 按钮冷却时间
		 *
		 */
		private function cdBtnTime() : void
		{
			var cdTime : int = MiXinManager.lastNextRefreshTime() / 1000;
			if ( cdTime <= 0 )
			{
				_skin.labCountDown.visible = true;
				_skin.labRate.visible = false;
				_skin.imgBar.visible = false;
				_skin.hpDi.visible = false;
				_skin.imgBar.width = IMG_WIDTH;

				if (MiXinManager.mixinTask != null && MiXinManager.mixinTask.quality >= EmQuality.QUALITY_ORANGE)
				{
					_skin.labCountDown.htmlText = LanguageConfig.getText(LangJiMaoXin.MI_XIN_HIGHT_QUALITY);
				}
				else
				{
					if (MiXinManager.mixinTask != null && MiXinManager.mixinTask.isSubmit)
						_skin.labCountDown.htmlText = LanguageConfig.getText(LangJiMaoXin.MI_XIN_CAN_RETURN_FOR);
					else
						_skin.labCountDown.htmlText = LanguageConfig.getText(LangJiMaoXin.MI_XIN_HAS_YET_TO_RETURN_FOR);
				}
				TimerServer.remove(cdBtnTime);
			}
			else
			{
				_skin.labCountDown.visible = false;
				_skin.labRate.visible = true;
				_skin.imgBar.visible = true;
				_skin.hpDi.visible = true;
				TweenLite.killTweensOf( _skin.imgBar );
				TweenLite.to( _skin.imgBar, cdTime, { width:0, onComplete: function complete() : void
				{
					_skin.imgBar.width = IMG_WIDTH;
				}, ease:Linear.easeNone, overwrite:false } );
				_skin.labRate.htmlText = cdTime + LanguageConfig.getText( LangText.TIME_SECOND );
			}
		}

		/**
		 * 点击事件
		 * @param target
		 *
		 */
		override protected function onTouchTarget(target : DisplayObject) : void
		{
			super.onTouchTarget(target);
			switch (target)
			{
				case _skin.btnGiveUp: //放弃任务
				{
					MiXinManager.giveUpMixin();
					break;
				}
				case _skin.btnReturn: //回本国王城
				{
					TouJingManager.returnMyCountry();
					break;
				}
				default:
					break;
			}
		}

		/**
		 * labPoint1
		 * @param e
		 *
		 */
		private function onAcceptLabTouch(e : TouchEvent) : void
		{
			var touch : Touch;
			touch = e.getTouch(_skin.labPoint1);
			if (touch == null)
			{
				onAcceptLabMouseOut();
				return;
			}

			touch = e.getTouch(_skin.labPoint1, TouchPhase.HOVER);
			if (touch != null)
				onAcceptLabMouseMove();

			touch = e.getTouch(_skin.labPoint1, TouchPhase.BEGAN);
			if (touch == null)
				return;

			if (MiXinManager.mixinTask != null && MiXinManager.mixinTask.isSubmit)
				onAcceptLabClick();//labPoint1  换到了鸡毛信，就跑接任务海外的坐标
			else
				onSubmitLabClick();//labPoint1  没换到了鸡毛信，就跑目标国家（强国）换鸡毛信

		}

		/**
		 *  labPoint1
		 *
		 */
		private function onAcceptLabMouseMove() : void
		{
//			_skin.labPoint1.y = originalPoint1Y + 2;
			_skin.labPoint1.color = StaticValue.COLOR_CODE_16;
		}

		/**
		 *  labPoint1
		 *
		 */
		private function onAcceptLabMouseOut() : void
		{
//			_skin.labPoint1.y = originalPoint1Y;
			_skin.labPoint1.color = StaticValue.COLOR_CODE_15;
		}

		/**
		 * labPoint2
		 * @param e
		 *
		 */
		private function onSubmitLabTouch(e : TouchEvent) : void
		{
			var touch : Touch;
			touch = e.getTouch(_skin.labPoint2);
			if (touch == null)
			{
				onSubmitLabMouseOut();
				return;
			}

			touch = e.getTouch(_skin.labPoint2, TouchPhase.HOVER);
			if (touch != null)
				onSubmitLabMouseMove();

			touch = e.getTouch(_skin.labPoint2, TouchPhase.BEGAN);
			if (touch == null)
				return;

			var countryData : CountryData = CountryManager.selfCountryData; //自己国家数据
			if (countryData == null)
				return;
//
//			var miXinTargetCountryData : CountryData = CountryManager.getCountryData(countryData.strategy.miXinTargetCountry);
//			if (miXinTargetCountryData == null)
//				return;

			if ( countryData.isWeakCountry ) //弱国
				onWeakLabClick();
			else
				onSubmitLabClick();
		}

		/**
		 *  labPoint2
		 *
		 */
		private function onSubmitLabMouseMove() : void
		{
//			_skin.labPoint2.y = originalPoint2Y + 2;
			_skin.labPoint2.color = StaticValue.COLOR_CODE_16;
		}

		/**
		 * labPoint2
		 *
		 */
		private function onSubmitLabMouseOut() : void
		{
//			_skin.labPoint2.y = originalPoint2Y;
			_skin.labPoint2.color = StaticValue.COLOR_CODE_15;
		}

		/**
		 * 海娃寻路
		 *
		 */
		private function onAcceptLabClick() : void
		{
			var npcData : MonsterDataProto;
			if (CountryManager.isAtMyCountry())
				npcData = MonsterDataManager.getData(MiXinCfgData.acceptNpc);//在本国
			else
				npcData = MonsterDataManager.getData(NpcCfgData.countryTransNPCId);//非本国就去边境，然后回国

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
		 *  强国狗娃寻路
		 *
		 */
		private function onSubmitLabClick() : void
		{
			var npcData : MonsterDataProto;
			if (CountryManager.isAtMyCountry())
			{
				//在本国就去边境，然后去目标国家
				npcData = MonsterDataManager.getData(NpcCfgData.countryTransNPCId);
			}
			else
			{
				if (MiXinManager.isMiXinTargetCountry())
					npcData = MonsterDataManager.getData(MiXinCfgData.submitNpc);
				else
					npcData = MonsterDataManager.getData(NpcCfgData.countryTransNPCId);//不是目标国家，去边境
			}
			if (npcData == null)
				return;

			var pos : Point = MonsterDataManager.getMonsterPosition(npcData);
			var sceneRole : SceneRole = SceneManager.getSceneNpcByModelId(npcData.id);
			var searchRoleData : SearchRoleData = new SearchRoleData();
			searchRoleData.searchId = npcData.id;
			searchRoleData.targetData = (sceneRole ? sceneRole.data as MonsterData : null);

			MainRoleSearchPathManager.walkToScene(npcData.sceneId, pos.x, pos.y, function openPanel() : void
			{
				var targerId : Number = (searchRoleData.targetData ? searchRoleData.targetData.id : 0);
				var role : SceneRole = SceneManager.getScene().getSceneObjByID(targerId, SceneCharType.NPC) as SceneRole;
				SceneRoleSelectManager.selectedRole = role;
				AppManager.showAppNoHide(AppConstant.TASK_DIAILOG_FUNC_PANEL, targerId);
			}, 200, searchRoleData);
		}

		/**
		 *  弱国  阳平关狗娃寻路
		 *
		 */
		private function onWeakLabClick() : void
		{
			var npcData : MonsterDataProto;
			if (CountryManager.isAtMyCountry())
			{
				//在本国就去边境，然后去目标国家
				npcData = MonsterDataManager.getData(NpcCfgData.countryTransNPCId);
			}
			else
			{
				if (MiXinManager.isMiXinTargetCountry())
					npcData = MonsterDataManager.getData(MiXinCfgData.weakRefleshNpc);
				else
					npcData = MonsterDataManager.getData(NpcCfgData.countryTransNPCId);//不是目标国家，去边境
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
		 * 显示面板
		 *
		 */
		public function onShow() : void
		{
			this.visible = true;
		}

		/**
		 * 隐藏面板
		 *
		 */
		public function onHide() : void
		{
			this.visible = false;
		}
	}
}
