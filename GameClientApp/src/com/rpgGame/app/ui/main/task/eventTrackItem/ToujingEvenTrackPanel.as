package com.rpgGame.app.ui.main.task.eventTrackItem
{
	import com.rpgGame.app.cmdlistener.enum.EmQuality;
	import com.rpgGame.app.manager.country.CountryManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.MainRoleSearchPathManager;
	import com.rpgGame.app.manager.role.SceneRoleSelectManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.manager.task.TouJingManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.country.CountryEvent;
	import com.rpgGame.core.events.toujing.TouJingEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.country.CountryNameCfgData;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.cfg.npc.NpcCfgData;
	import com.rpgGame.coreData.cfg.task.TouJingCfgData;
	import com.rpgGame.coreData.info.SearchRoleData;
	import com.rpgGame.coreData.info.toujing.TouJingTaskData;
	import com.rpgGame.coreData.lang.LangText;
	import com.rpgGame.coreData.lang.LangTouJing;
	import com.rpgGame.coreData.role.MonsterData;
	import com.rpgGame.coreData.type.SceneCharType;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
	import flash.geom.Point;
	
	import app.message.MonsterDataProto;
	
	import feathers.controls.Scroller;
	import feathers.data.ListCollection;
	
	import gs.TweenLite;
	import gs.easing.Linear;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.dailyTaskEventTrack.trackItem.TouJingEventTrackSkin;
	
	import starling.display.DisplayObject;
	import starling.display.Shape;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	import utils.TimerServer;

	/**
	 * 偷经标签页
	 * @author 陈鹉光
	 *
	 */
	public class ToujingEvenTrackPanel extends SkinUI
	{
		private var _skin : TouJingEventTrackSkin;
		/** cd时间 **/
		private var _cdTime : int = 10;
//		/** lable原来的Y坐标  **/
//		private var originalPoint1Y : Number;
		/** 原来的宽度 **/
		private static const IMG_WIDTH : Number = 120;
		/** 背景 **/
		private var _shape1:Shape;

		public function ToujingEvenTrackPanel()
		{
			_skin = new TouJingEventTrackSkin();
			super(_skin);
			init();
		}

		private function init() : void
		{
//			_skin.labCD.htmlText = LanguageConfig.getText( LangTask.MI_XIN_HAS_YET_TO_RETURN_FOR );
//			originalPoint1Y = _skin.labCountryName.y;
			
			//背景
			_shape1 = new Shape();
			_shape1.graphics.clear();
			_shape1.graphics.beginFill(StaticValue.COLOR_CODE_23, 0.5);
			_shape1.graphics.drawRect(_skin.img1.x, _skin.img1.y, _skin.img1.width, _skin.img1.height);
			_shape1.graphics.endFill();
			addChildAt( _shape1, 0 );
			_skin.img1.visible = false;
			
			EventManager.addEvent(CountryEvent.COUNTRY_DATA_ONLINE, onUpdataJingShu);
			EventManager.addEvent(TouJingEvent.TOUJING_COUNTRY_JINGSHU_CHANGE, onUpdataJingShu);
			EventManager.addEvent(TouJingEvent.TOUJING_SUCCEED, onUpdateTime);
			EventManager.addEvent(TouJingEvent.TOUJING_COMPLETE, onUpdateSkin);
			EventManager.addEvent(TouJingEvent.TOUJING_ACCEPT_TASK, onUpdateSkin);
			_skin.labCountryName.addEventListener(TouchEvent.TOUCH, onLabTouch);
		}

		override protected function onShow() : void
		{
			_skin.labQuality.visible = false;
			_skin.labQuality.htmlText = "";
			_skin.imgBar.visible = false;
			_skin.hpDi.visible = false;
			_skin.labRate.visible = false;
			
			initVisible(false);
			initList();
			onUpdataJingShu();
			onUpdateSkin();
			changUINumberValue(false);
			
			EventManager.addEvent(CountryEvent.COUNTRY_DATA_ONLINE, onUpdataJingShu);
			EventManager.addEvent(TouJingEvent.TOUJING_COUNTRY_JINGSHU_CHANGE, onUpdataJingShu);
			EventManager.addEvent(TouJingEvent.TOUJING_SUCCEED, onUpdateTime);
			EventManager.addEvent(TouJingEvent.TOUJING_COMPLETE, onUpdateSkin);
			EventManager.addEvent(TouJingEvent.TOUJING_ACCEPT_TASK, onUpdateSkin);
			EventManager.addEvent( TouJingEvent.TOUJING_CHECK_STATE, onUpdateSkin );
			_skin.labCountryName.addEventListener(TouchEvent.TOUCH, onLabTouch);
		}

		override protected function onHide():void
		{
			EventManager.removeEvent( CountryEvent.COUNTRY_DATA_ONLINE, onUpdataJingShu );
			EventManager.removeEvent( TouJingEvent.TOUJING_COUNTRY_JINGSHU_CHANGE, onUpdataJingShu );
			EventManager.removeEvent( TouJingEvent.TOUJING_SUCCEED, onUpdateTime );
			EventManager.removeEvent( TouJingEvent.TOUJING_COMPLETE, onUpdateSkin );
			EventManager.removeEvent( TouJingEvent.TOUJING_ACCEPT_TASK, onUpdateSkin );
			EventManager.removeEvent( TouJingEvent.TOUJING_CHECK_STATE, onUpdateSkin );
			_skin.labCountryName.removeEventListener( TouchEvent.TOUCH, onLabTouch );
		}

		/**
		 * 倒计时
		 *
		 */
		private function onUpdateTime(type : int = 0) : void
		{
			TimerServer.addLoop(changUINumberValue, 1000, [true]);
			onUpdateSkin();
		}

		/**
		 * 更新面板显示
		 * @param type
		 *
		 */
		private function onUpdateSkin(type : int = 0) : void
		{
			if (TouJingManager.touJingData == null)
				return;

			var data:TouJingTaskData = TouJingManager.touJingData;
			if ( !TouJingManager.touJingData.isTouSuccess && TouJingManager.curJingShuQuality != EmQuality.QUALITY_GRAY ) //没偷到经书
			{
				initVisible(false);
				_skin.labTittle.htmlText = LanguageConfig.getText(LangTouJing.TOU_JING_EVENTTRACK_TITLE_1);
				_skin.labDesc.htmlText = LanguageConfig.getText(LangTouJing.TOU_JING_EVENTTRACK_DESC_1);
				_skin.labQuality.visible = false;
				onUpdataJingShu();
			}
			else
			{
				initVisible(true);
				_skin.labTittle.htmlText = LanguageConfig.getText(LangTouJing.TOU_JING_EVENTTRACK_TITLE_2);
				_skin.labDesc.htmlText = LanguageConfig.getText(LangTouJing.TOU_JING_EVENTTRACK_DESC_2);
				_skin.labQuality.visible = true;
				var npcData : MonsterDataProto = MonsterDataManager.getData(TouJingCfgData.acceptNpcID);
				if (npcData == null)
					return;

				var countryName : String = "【" + CountryNameCfgData.getCountryNameById(TouJingManager.touJingData.countryID) + "】";
				var quality:int;
				if ( TouJingManager.touJingData.countryID != 0 && TouJingManager.curJingShuQuality == EmQuality.QUALITY_GRAY )//灰色经书需要特殊处理
					quality = TouJingManager.curJingShuQuality;
				else
					quality = TouJingManager.touJingData.quality;
				_skin.labJingShuState.htmlText = TouJingManager.getJingShuColor( quality );
				_skin.labCountryName.htmlText = "【" + CountryNameCfgData.getCountryNameById(TouJingManager.touJingData.countryID) + "】";
			}
			onStatue();
		}

		/**
		 * 初始化一些visible
		 *
		 */
		private function initVisible(isVisible : Boolean) : void
		{
			_skin.labBelongsCountry.visible = isVisible;
			_skin.labJingShuQuality.visible = isVisible;
			_skin.labCountDown.visible = isVisible;
			_skin.labComplete.visible = isVisible;
			_skin.labCountryName.visible = isVisible;
			_skin.labJingShuState.visible = isVisible;
			_skin.btnReturn.visible = isVisible;
			_skin.list.visible = !isVisible;
			_skin.labMyCountry.visible = !isVisible;
		}

		/**
		 * 倒计时
		 *
		 */
		private function changUINumberValue(isBool : Boolean) : void
		{
			if (isBool)
			{
				if ( _cdTime <= 0 )
				{
					TimerServer.remove(changUINumberValue);
					_cdTime = 10;
					_skin.imgBar.width = IMG_WIDTH;
					_skin.labQuality.visible = true;
					_skin.imgBar.visible = false;
					_skin.hpDi.visible = false;
					_skin.labRate.visible = false;
					onStatue();
				}
				else
				{
					TouJingManager.touJingCDIsEnd = false;
					_skin.labQuality.visible = false;
					_skin.labQuality.htmlText = "";
					_skin.imgBar.visible = true;
					_skin.hpDi.visible = true;
					_skin.labRate.visible = true;

					TweenLite.killTweensOf( _skin.imgBar );
					TweenLite.to( _skin.imgBar, _cdTime, { width:0, onComplete: function complete() : void
					{
						_skin.imgBar.width = IMG_WIDTH;
						TouJingManager.touJingCDIsEnd = true;
					}, ease:Linear.easeNone, overwrite:false } );
					_skin.labRate.htmlText = _cdTime + LanguageConfig.getText(LangText.TIME_SECOND);
					_cdTime--;
				}
			}
			else
			{
				if (TouJingManager.touJingData != null && TouJingManager.touJingData.isTouSuccess)
				{
					_skin.labQuality.visible = true;
					_skin.imgBar.visible = false;
					_skin.hpDi.visible = false;
					_skin.labRate.visible = false;
				}
			}
		}

		/**
		 * 夺经lab状态
		 *
		 */
		private function onStatue() : void
		{
			if (TouJingManager.touJingData != null && TouJingManager.touJingData.isTouSuccess && TouJingManager.touJingData.quality >= EmQuality.QUALITY_ORANGE)
			{
				_skin.labQuality.htmlText = LanguageConfig.getText(LangTouJing.TOU_JING_HIGHT_QUALITY);
			}
			else
			{
				if ( TouJingManager.touJingData != null && TouJingManager.touJingData.isTouSuccess )
				{
					_skin.labQuality.visible = true;
					_skin.labQuality.htmlText = LanguageConfig.getText(LangTouJing.TOU_JING_CAN_RETURN_FOR);
				}
				else
				{
					if( TouJingManager.touJingData != null && TouJingManager.touJingData.countryID != 0 && TouJingManager.curJingShuQuality == EmQuality.QUALITY_GRAY )
					{
						_skin.labQuality.htmlText = LanguageConfig.getText(LangTouJing.TOU_JING_CAN_RETURN_FOR);
					}
				}
			}
		}

		/**
		 * 经书更新
		 *
		 */
		private function onUpdataJingShu( arr:Array=null ) : void
		{
			if( arr == null )
				_skin.list.dataProvider.data = CountryManager.otherCountryJingShuArr;
			else
				_skin.list.dataProvider.data = arr;
			//显示数据
			updateMyCountryJingShu()
		}
		
		/**
		 * 本国经书数量 
		 * 
		 */		
		private function updateMyCountryJingShu():void
		{
			var countryName:String = CountryNameCfgData.getCountryNameById( MainRoleManager.actorInfo.countryId );
			var jingshuNum:int = CountryManager.getJingShuAmountByCountryId(MainRoleManager.actorInfo.countryId);
			
			var levelStr:String = CountryManager.getCountryJingShuState( MainRoleManager.actorInfo.countryId );
			var str:String = HtmlTextUtil.getTextColor( TouJingManager.getColorByCountryId( MainRoleManager.actorInfo.countryId ), "（" + levelStr + "）" );
			_skin.labMyCountry.htmlText = LanguageConfig.getText( LangTouJing.TOU_JING_MY_COUNTRY_JINGSHU, countryName, str, jingshuNum );
		}

		/**
		 * 初始化列表
		 *
		 */
		private function initList() : void
		{
			_skin.list.dataProvider = new ListCollection();
			//ListItem自定义类型
			_skin.list.itemRendererType = TouJingListItem;
			_skin.list.clipContent = true;
			//滚动条显示模式
			_skin.list.verticalScrollBarPosition = Scroller.VERTICAL_SCROLL_BAR_POSITION_RIGHT;
			//滚动条开关[auto, on, off]
			_skin.list.verticalScrollPolicy = Scroller.SCROLL_POLICY_AUTO;
			_skin.list.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			//滚动条显示模式  一直显示滚动条:fixedFloat|拖动的时候才显示滚动条:float|不显示滚动条，但仍可以拖动:none;
			_skin.list.scrollBarDisplayMode = Scroller.SCROLL_BAR_DISPLAY_MODE_FIXED_FLOAT;
			_skin.list.verticalScrollStep = 5; //CustomLayoutGroupItemRenderer.height
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
		private function onLabTouch(e : TouchEvent) : void
		{
			var touch : Touch;
			touch = e.getTouch(_skin.labCountryName);
			if (touch == null)
			{
				onLabMouseOut();
				return;
			}

			touch = e.getTouch(_skin.labCountryName, TouchPhase.HOVER);
			if (touch != null)
				onLabMouseMove();

			touch = e.getTouch(_skin.labCountryName, TouchPhase.BEGAN);
			if (touch == null)
				return;

			onClick();

		}

		/**
		 *  labPoint1
		 *
		 */
		private function onLabMouseMove() : void
		{
//			_skin.labCountryName.y = originalPoint1Y + 2;
			_skin.labCountryName.color = StaticValue.COLOR_CODE_16;
		}

		/**
		 *  labPoint1
		 *
		 */
		private function onLabMouseOut() : void
		{
//			_skin.labCountryName.y = originalPoint1Y;
			_skin.labCountryName.color = StaticValue.COLOR_CODE_15;
		}

		/**
		 *  点击国家名称可以寻路到边境
		 *
		 */
		private function onClick() : void
		{
			if (TouJingManager.touJingData == null)
				return;

			var npcData : MonsterDataProto;
			if (MainRoleManager.actorInfo.sceneSequence != TouJingManager.touJingData.countryID) //在哪个国家偷的
				npcData = MonsterDataManager.getData(NpcCfgData.countryTransNPCId);
			else
				npcData = MonsterDataManager.getData(TouJingCfgData.acceptNpcID);

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
		 * 自动寻路 
		 * 
		 */		
		private function findAcceptNpc():void
		{
			if (TouJingManager.touJingData == null)
				return;
			
			var npcData : MonsterDataProto;
			if (CountryManager.isAtMyCountry())
				npcData = MonsterDataManager.getData(TouJingCfgData.acceptNpcID);
			else
				npcData = MonsterDataManager.getData(NpcCfgData.countryTransNPCId);
			
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
