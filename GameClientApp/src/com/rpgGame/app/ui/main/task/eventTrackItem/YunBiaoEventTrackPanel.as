package com.rpgGame.app.ui.main.task.eventTrackItem
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.app.manager.ReliveManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.country.CountryManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.MainRoleSearchPathManager;
	import com.rpgGame.app.manager.role.SceneRoleSelectManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.manager.task.TouJingManager;
	import com.rpgGame.app.manager.yunBiao.YunBiaoManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.sender.YunBiaoSender;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.MapEvent;
	import com.rpgGame.core.events.YunBiaoEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.biao.BiaoCfgData;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.cfg.npc.NpcCfgData;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.info.SearchRoleData;
	import com.rpgGame.coreData.info.map.SceneData;
	import com.rpgGame.coreData.lang.LangText;
	import com.rpgGame.coreData.lang.LangYunBiao;
	import com.rpgGame.coreData.role.BiaoCheData;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.role.MonsterData;
	import com.rpgGame.coreData.type.SceneCharType;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
	import flash.geom.Point;
	
	import app.message.MonsterDataProto;
	
	import feathers.controls.Label;
	
	import gs.TweenLite;
	import gs.easing.Linear;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.dailyTaskEventTrack.trackItem.YunBiaoEventTrackSkin;
	
	import starling.display.DisplayObject;
	import starling.display.Shape;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	import utils.TimerServer;

	/**
	 * 运镖标签页
	 * @author 陈鹉光
	 *
	 */
	public class YunBiaoEventTrackPanel extends SkinUI
	{
		private var _skin : YunBiaoEventTrackSkin;
		/** 原来的宽度 **/
		private static const IMG_WIDTH : Number = 120;
		/** 下车位置X **/
		private static const POSX : Number = 100;
		/** 下车位置Y **/
		private static const POSY : Number = 100;
		/** 场景id **/
		private var _sceneId : int;
		/** 镖车数据 **/
		private var _biaoData : BiaoCheData;
		/** 运镖时长计时器 **/
		private var gTime : GameTimer;
		/** 镖车位置刷新计时器 **/
		private var biaoGTime : GameTimer;
		/** 镖车的坐标  x **/
		private var oldPosX : int = 0;
		/** 镖车的坐标  y **/
		private var oldPosY : int = 0;
		/** cd时间 **/
		private var _cdTime : int;
		/** 镖车所在的场景是哪个国家的   副本、中立时是 0，是无效值 **/
		public var _sceneSequence:int;
		/** 军需官1是否已验镖 **/
		private var isYan1:Boolean;
		/** 军需官2是否已验镖 **/
		private var isYan2:Boolean;
		/** 背景 **/
		private var _shape1:Shape;
		/** 背景 **/
		private var _shape2:Shape;

		public function YunBiaoEventTrackPanel()
		{
			_skin = new YunBiaoEventTrackSkin();
			super(_skin);
			init();
		}

		/**
		 * 初始化
		 *
		 */
		private function init() : void
		{
			biaoGTime = new GameTimer("biaoGTime", 100);
			biaoGTime.onUpdate = updatePoint;
			biaoGTime.start();

			_cdTime = YunBiaoManager.lastNextRefreshTime() / 1000;
			changRefreshTime(false);
			_skin.btnGetOn.visible = false;
			_skin.btnGetOff.visible = false;
			_skin.btnXun.visible = false;
			_skin.imgJiantou1.visible = false;
			_skin.imgJiantou2.visible = false;
			_skin.imgJiantou3.visible = false;
			
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
		}

		/**
		 *当面板显示时,给子类处理自身逻辑
		 */
		override protected function onShow() : void
		{
			if (gTime != null)
				gTime.stop();
			
			if( YunBiaoManager.hasBiao )//有运镖任务的时候，才需要
			{
				if (gTime == null)
				{
					gTime = new GameTimer("gTime");
					gTime.onUpdate = onUpdateTime;
				}
				gTime.start();
			}
			EventManager.addEvent(YunBiaoEvent.ACCEPT_BIAO, onStart);
			EventManager.addEvent(YunBiaoEvent.CHECK_ON_LOGIN_BIAO, onUpdateOnline);
			EventManager.addEvent(MapEvent.MAP_SWITCH_COMPLETE, updatePoint);
			EventManager.addEvent(YunBiaoEvent.ADD_BIAO, onUpdateInfo);
			EventManager.addEvent(YunBiaoEvent.BIAO_LIFE_UPDATE, updateHP);
			EventManager.addEvent(YunBiaoEvent.UPDATE_QUALITY_SUCCESS, updateQuality);
			EventManager.addEvent(YunBiaoEvent.REFRESH_YUN_BIAO_SUCCESS, onRefreshTime);
			EventManager.addEvent(YunBiaoEvent.BIAO_STOP, onBiaoCheStop);
			EventManager.addEvent(YunBiaoEvent.BIAO_SCENE_POINT, onBiaoCheStop);
			EventManager.addEvent( YunBiaoEvent.BIAO_UPDATE_BIAO_STATE, updateNpcInfo );
			EventManager.addEvent( YunBiaoEvent.BIAO_LIFE_UPDATE_NOT, onUpdateBiaoState );

			_skin.labPointRealTime.addEventListener(TouchEvent.TOUCH, onLabTouch);
			_skin.labPointRefresh1.addEventListener(TouchEvent.TOUCH, onLabTouch);
			_skin.labPointRefresh2.addEventListener(TouchEvent.TOUCH, onLabTouch);
			_skin.labPointComplete.addEventListener(TouchEvent.TOUCH, onLabTouch);
		}

		/**
		 *被动方法,当SkinUI子类实例从显示列表移除后会被调用
		 */
		override protected function onHide() : void
		{
			if (gTime != null)
				gTime.stop();
			
			EventManager.removeEvent(YunBiaoEvent.ACCEPT_BIAO, onStart);
			EventManager.removeEvent(YunBiaoEvent.CHECK_ON_LOGIN_BIAO, onUpdateOnline);
			EventManager.removeEvent(MapEvent.MAP_SWITCH_COMPLETE, updatePoint);
			EventManager.removeEvent(YunBiaoEvent.ADD_BIAO, onUpdateInfo);
			EventManager.removeEvent(YunBiaoEvent.BIAO_LIFE_UPDATE, updateHP);
			EventManager.removeEvent(YunBiaoEvent.UPDATE_QUALITY_SUCCESS, updateQuality);
			EventManager.removeEvent(YunBiaoEvent.REFRESH_YUN_BIAO_SUCCESS, onRefreshTime);
			EventManager.removeEvent(YunBiaoEvent.BIAO_SCENE_POINT, onBiaoCheStop);
			EventManager.removeEvent(YunBiaoEvent.BIAO_STOP, onBiaoCheStop);
			EventManager.removeEvent( YunBiaoEvent.BIAO_UPDATE_BIAO_STATE, updateNpcInfo );
			EventManager.removeEvent( YunBiaoEvent.BIAO_LIFE_UPDATE_NOT,onUpdateBiaoState );

			_skin.labPointRealTime.removeEventListener(TouchEvent.TOUCH, onLabTouch);
			_skin.labPointRefresh1.removeEventListener(TouchEvent.TOUCH, onLabTouch);
			_skin.labPointRefresh2.removeEventListener(TouchEvent.TOUCH, onLabTouch);
			_skin.labPointComplete.removeEventListener(TouchEvent.TOUCH, onLabTouch);
		}

		/**
		 * 镖车位置
		 * @param data
		 *
		 */
		private function onBiaoCheStop( data:BiaoCheData ):void
		{
			_sceneId = data.sceneId;
			_sceneSequence = data.sceneSequence;
			oldPosX = data.x;
			oldPosY = data.y;
			_biaoData = data;
			updateBiaoState(data);
		}

		/**
		 * 下一轮刷新镖车的倒计时
		 *
		 */
		private function onRefreshTime() : void
		{
			TimerServer.addLoop(changRefreshTime, 1000, [true]);
		}

		/**
		 * 更新界面倒计时显示
		 * @param isBool 判断是不是事件（REFRESH_YUN_BIAO_SUCCESS）发过来的
		 *
		 */
		private function changRefreshTime(isBool : Boolean) : void
		{
			if (isBool)
			{
				if (_cdTime <= 0)
				{
					YunBiaoManager.isEnd = true;
					TimerServer.remove(changRefreshTime);
					_cdTime = YunBiaoManager.lastNextRefreshTime() / 1000;
					_skin.imgBar0.visible = false;
					_skin.hpDi0.visible = false;
					_skin.labRate0.visible = false;
					_skin.imgBar0.width = IMG_WIDTH;
					_skin.labState.htmlText = LanguageConfig.getText( LangYunBiao.YUN_BIAO_COUNT_DOWN, HtmlTextUtil.getTextColor( StaticValue.COLOR_CODE_15, "-" ) );
				}
				else
				{
					_skin.imgBar0.visible = true;
					_skin.hpDi0.visible = true;
					_skin.labRate0.visible = true;
					YunBiaoManager.isEnd = false;
					_skin.labState.htmlText = LanguageConfig.getText( LangYunBiao.YUN_BIAO_COUNT_DOWN, "" );
					
					TweenLite.killTweensOf(_skin.imgBar0);
					TweenLite.to(_skin.imgBar0, _cdTime, {width: 0, onComplete: function complete() : void
					{
						_skin.imgBar0.width = IMG_WIDTH;
					}, ease: Linear.easeNone, overwrite: false});
					_skin.labRate0.htmlText = _cdTime + LanguageConfig.getText(LangText.TIME_SECOND);
					_cdTime--;
				}
			}
			else
			{
				_skin.imgBar0.visible = false;
				_skin.hpDi0.visible = false;
				_skin.labRate0.visible = false;
				_skin.labState.htmlText = LanguageConfig.getText( LangYunBiao.YUN_BIAO_COUNT_DOWN, HtmlTextUtil.getTextColor( StaticValue.COLOR_CODE_15, "-" ) );
			}
		}

		/**
		 * 上线检测运镖状态
		 *
		 */
		private function onUpdateOnline() : void
		{
			_biaoData = MainRoleManager.actorInfo.biaoCheData;
			if (_biaoData == null)
				return;

			_sceneId = _biaoData.sceneId;
			_sceneSequence = _biaoData.sceneSequence;
			onUpdateInfo();
			updateQuality();
		}

		/**
		 * 接了运镖之后，显示运镖倒计时长
		 * @param type
		 *
		 */
		private function onStart(type : int = 0) : void
		{
			var heroData : HeroData = MainRoleManager.actorInfo;
			_sceneId = heroData.mapID;
			oldPosX = MainRoleManager.actor.position.x;
			oldPosY = MainRoleManager.actor.position.z;
			onUpdateInfo();
		}

		/**
		 * 更新运镖倒计时长
		 *
		 */
		private function onUpdateTime() : void
		{
			if (YunBiaoManager.biaoExpireDuration < 0)
			{
				YunBiaoManager.biaoExpireDuration = 0;
				if (gTime != null)
					gTime.stop();
				return;
			}
			_skin.labCountDown.htmlText =TimeUtil.timeFormatCH( YunBiaoManager.biaoExpireDuration );
		}

		/**
		 * 追踪栏显示数据更新
		 * @param type
		 *
		 */
		private function onUpdateInfo(type : int = 0) : void
		{
			_biaoData = MainRoleManager.actorInfo.biaoCheData;
			if (_biaoData == null)
				return;

			updateHP( _biaoData, true );
			updatePoint();
			updateNpcInfo();
			updateQuality();
			updateBiaoState(_biaoData);
		}

		/**
		 * 更新品质成功
		 *
		 */
		private function updateQuality() : void
		{
			var str:String = "";
			if( _biaoData != null )
			{
				if( _biaoData.isInvivcibleBiao )
					str = TouJingManager.getJingShuColor(_biaoData.quality) + LanguageConfig.getText( LangYunBiao.YUN_BIAO_INVINCIBLE_BIAO );
				else
					str = TouJingManager.getJingShuColor(_biaoData.quality);
			}
			_skin.labQulity.htmlText = str;
		}

		/**
		 *  血量变化
		 * @param data 镖车
		 * @param isSafety 
		 * 
		 */		
		private function updateHP( data:BiaoCheData, isSafety:Boolean ) : void
		{
			var curHP : Number = data.hp;
			var maxHP : Number = data.totalStat.life;
			var rate : Number = curHP / maxHP;
			_skin.imgBar.width = _skin.hpDi.width * rate;
			_skin.labRate.htmlText = Math.round(rate * 100) + "%";
			onUpdateBiaoState(isSafety);
		}
		
		/**
		 * 镖车没有受到伤害了
		 * 
		 */		
		private function onUpdateBiaoState(isSafety:Boolean):void
		{
			if( !isSafety )
				_skin.labAnQuan.htmlText = LanguageConfig.getText(LangYunBiao.YUN_BIAO_NAME_7);
			else
				_skin.labAnQuan.htmlText = LanguageConfig.getText(LangYunBiao.YUN_BIAO_NAME_8);
		}

		/**
		 *  镖车位置实时更新
		 *
		 */
		private function updatePoint() : void
		{
			if (_biaoData == null)
				return;

			oldPosX = _biaoData.x;
			oldPosY = _biaoData.y;
			updateBiaoState(_biaoData);
		}

		/**
		 * 镖车状态更新
		 *
		 */
		private function updateBiaoState( data:BiaoCheData ) : void
		{
			if( data == null )
				return;
				
			var biaoState:String;
			//镖车的坐标
			var biaoPoint : Point = new Point(data.x, data.y); 
			
			
			var selfPosX:Number = MainRoleManager.actor.position.x;
			var selfPosY:Number = MainRoleManager.actor.position.z;
			//自己的坐标
			var myPoint:Point = new Point(selfPosX, selfPosY);
			//人跟镖车的距离
			var distance : Number = Math.round( Point.distance(biaoPoint, myPoint) );
			//上镖车距离镖车的最大距离是多少才可以上车
			var upToBiaoMaxDistance:Number = BiaoCfgData.miscData.up_to_biao_max_distance;
			
			if( data.isInBiao )//在镖车上
			{
				_skin.btnGetOn.visible = false;
				_skin.btnGetOff.visible = true;
				_skin.btnXun.visible = false;
				biaoState = HtmlTextUtil.getTextColor( StaticValue.COLOR_CODE_15, LanguageConfig.getText( LangYunBiao.YUN_BIAO_STATE_1 ) );
				YunBiaoManager.isYuanLi = false;
			}
			else
			{
				if( !CountryManager.isAtMyCountry() )
				{
					//远离镖车
					_skin.btnGetOn.visible = false;
					_skin.btnGetOff.visible = false;
					_skin.btnXun.visible = true;
					biaoState = HtmlTextUtil.getTextColor( StaticValue.COLOR_CODE_13, LanguageConfig.getText( LangYunBiao.YUN_BIAO_STATE_3 ) );
					_skin.labPointRealTime.htmlText = biaoState;
					YunBiaoManager.isYuanLi = true;
					return;
				}
				
				var isBool:Boolean = YunBiaoManager.isFollowimg;
				if( distance < upToBiaoMaxDistance || YunBiaoManager.isFollowimg )
				{
					//不在镖车上（跟随状态）
					_skin.btnGetOn.visible = true;
					_skin.btnGetOff.visible = false
					_skin.btnXun.visible = false;
					biaoState = HtmlTextUtil.getTextColor( StaticValue.COLOR_CODE_15, LanguageConfig.getText( LangYunBiao.YUN_BIAO_STATE_2 ) );
					YunBiaoManager.isYuanLi = false;
				}
				else
				{
					//远离镖车
					_skin.btnGetOn.visible = false;
					_skin.btnGetOff.visible = false;
					_skin.btnXun.visible = true;
					biaoState = HtmlTextUtil.getTextColor( StaticValue.COLOR_CODE_13, LanguageConfig.getText( LangYunBiao.YUN_BIAO_STATE_3 ) );
					YunBiaoManager.isYuanLi = true;
				}
			}
			
			_skin.labPointRealTime.htmlText = biaoState;
		}

		/**
		 *　npc位置信息
		 *
		 */
		private function updateNpcInfo() : void
		{
			var npcData : MonsterDataProto; //npcProto数据
			var mapInfo : SceneData; //地图配置数据
			var pos : String; //坐标
			var npcPos : Point;
			var str:String;
			var nextIndex:int = YunBiaoManager.nextIndex;//下一个需要验镖的npc的下标

			//-------------------军需官1--------------------------//
			npcData = MonsterDataManager.getData(BiaoCfgData.refleshWangNpc);
			if (npcData != null)
			{
				npcPos = MonsterDataManager.getMonsterPosition(npcData);
				mapInfo = MapDataManager.getMapInfo(npcData.sceneId);
				var npcModelId1:int = SceneManager.getSceneNpcModelId( npcData.id );
				if( nextIndex > 0 )
				{
					pos = HtmlTextUtil.getTextColor( StaticValue.COLOR_CODE_4, npcData.name + "：" );
					str = HtmlTextUtil.getTextColor( StaticValue.COLOR_CODE_15, LanguageConfig.getText( LangYunBiao.YUN_BIAO_YAN_BIAO_1 ) );
					_skin.imgJiantou1.visible = false;
					isYan1 = true;
				}
				else
				{
					pos = HtmlTextUtil.underLine( npcData.name ) + "：";
					str = HtmlTextUtil.getTextColor( StaticValue.COLOR_CODE_1, LanguageConfig.getText( LangYunBiao.YUN_BIAO_YAN_BIAO_2 ) );
					_skin.imgJiantou1.visible = true;
					isYan1 = false;
				}
				_skin.labPointRefresh1.htmlText = pos;
				_skin.labState1.htmlText = str;
//				_skin.labState1.x = _skin.labPointRefresh1.x + _skin.labPointRefresh1.textWidth + 2;
//				_skin.imgJiantou1.x = _skin.labState1.x + _skin.labState1.width + 10;
			}

			//-------------------军需官2--------------------------//
			npcData = MonsterDataManager.getData(BiaoCfgData.refleshYangNpc);
			if (npcData != null)
			{
				npcPos = MonsterDataManager.getMonsterPosition(npcData);
				mapInfo = MapDataManager.getMapInfo(npcData.sceneId);
				var npcModelId2:int = SceneManager.getSceneNpcModelId( npcData.id );
				var len:int = BiaoCfgData.miscData.check_biao_npcs.length;
				if( nextIndex >= len )
				{
					pos = HtmlTextUtil.getTextColor( StaticValue.COLOR_CODE_4, npcData.name + "：" );
					str = HtmlTextUtil.getTextColor( StaticValue.COLOR_CODE_15, LanguageConfig.getText( LangYunBiao.YUN_BIAO_YAN_BIAO_1 ) );
					_skin.imgJiantou2.visible = false;
					isYan2 = true;
				}
				else
				{
					if( isYan1 )
					{
						pos = HtmlTextUtil.underLine( npcData.name ) + "：";
						_skin.imgJiantou2.visible = true;
					}
					else
					{
						pos = HtmlTextUtil.getTextColor( StaticValue.COLOR_CODE_4, npcData.name + "：" );
						_skin.imgJiantou2.visible = false;
					}
					
					str = HtmlTextUtil.getTextColor( StaticValue.COLOR_CODE_1, LanguageConfig.getText( LangYunBiao.YUN_BIAO_YAN_BIAO_2 ) );
					isYan2 = false;
				}
				
				_skin.labPointRefresh2.htmlText = pos;
				_skin.labState2.htmlText = str;
//				_skin.labState2.x = _skin.labPointRefresh2.x + _skin.labPointRefresh2.textWidth + 2;
//				_skin.imgJiantou2.x = _skin.labState2.x + _skin.labState2.width + 10;
			}

			//-------------------边境交镖处--------------------------//
			npcData = MonsterDataManager.getData(BiaoCfgData.completeNpc);
			if (npcData != null)
			{
				npcPos = MonsterDataManager.getMonsterPosition(npcData);
				mapInfo = MapDataManager.getMapInfo(npcData.sceneId);
				_skin.labState3.htmlText = LanguageConfig.getText( LangYunBiao.YUN_BIAO_YAN_BIAO_3 );
				if( isYan1 && isYan2 )
				{
					pos = HtmlTextUtil.underLine( npcData.name ) + "：";
					_skin.imgJiantou3.visible = true;
				}
				else
				{
					pos = HtmlTextUtil.getTextColor( StaticValue.COLOR_CODE_4, npcData.name + "：" );
					_skin.imgJiantou3.visible = false;
				}
				_skin.labPointComplete.htmlText = pos;
//				_skin.labState3.x = _skin.labPointComplete.x + _skin.labPointComplete.textWidth + 2;
//				_skin.imgJiantou3.x = _skin.labState3.x + _skin.labState3.width + 10;
			}
		}

		/**
		 * onLabTouch
		 * @param e
		 *
		 */
		private function onLabTouch(e : TouchEvent) : void
		{
			var touch : Touch;
			var curObj : Label = e.currentTarget as Label;
			var lab : Label;
			var name : String = "";
			
			switch (curObj.name)
			{
//				case "labPointRealTime": //镖车位置
//					lab = _skin.labPointRealTime;
//					name = "labPointRealTime";
//					break;
				case "labPointRefresh1": //军需官1
					if( !onCheckSteps("labPointRefresh1") )
						return;
					
					lab = _skin.labPointRefresh1;
					name = "labPointRefresh1";
					break;
				case "labPointRefresh2": //军需官2
					if( !onCheckSteps("labPointRefresh2") )
						return;
					lab = _skin.labPointRefresh2;
					name = "labPointRefresh2";
					break;
				case "labPointComplete": //边境交镖处
					if( !onCheckSteps("labPointComplete") )
						return;
					lab = _skin.labPointComplete;
					name = "labPointComplete";
					break;
				default:
					break;
			}

			touch = e.getTouch(lab);
			if (touch == null)
			{
				onMouseOut(name);
				return;
			}

			touch = e.getTouch(lab, TouchPhase.HOVER);
			if (touch != null)
				onMouseMove(name);

			touch = e.getTouch(lab, TouchPhase.BEGAN);
			if (touch == null)
				return;

			onClick(name);
		}

		/**
		 * 检车验镖步骤，设置军需官lab状态 
		 * @return 
		 * 
		 */		
		private function onCheckSteps( typeString:String ):Boolean
		{
			var nextIndex:int = YunBiaoManager.nextIndex;//下一个需要验镖的npc的下标
			var len:int = BiaoCfgData.miscData.check_biao_npcs.length;
			
			if( typeString == "labPointRefresh1" && nextIndex <= 0 )//第一个军需官
				return true;
			else if( typeString == "labPointRefresh2" && nextIndex > 0 && nextIndex < len)//第二个军需官
				return true;
			else if( typeString == "labPointComplete" && nextIndex >= len )//交镖军需官
				return true;
			return false;
		}
		
		/**
		 * onClick
		 *
		 */
		private function onClick(name : String = "") : void
		{
			var npcData : MonsterDataProto;
			var npcPos : Point;
			var sceneRole : SceneRole;
			var searchRoleData : SearchRoleData;
			switch (name)
			{
				case "labPointRealTime": //镖车位置
					var sceneId:int = MainRoleManager.actorInfo.sceneSequence;
					if ( _sceneSequence == sceneId )//镖车停下来的位置是自己当前所在场景的国家是一致的，不然就先去边境传送
					{
						sceneRole = SceneManager.getSceneNpcByModelId(_biaoData.id);
						searchRoleData = new SearchRoleData();
						searchRoleData.searchId = _biaoData.id;
						searchRoleData.targetData = (sceneRole ? sceneRole.data as MonsterData : null);
						MainRoleSearchPathManager.walkToScene(_sceneId, oldPosX, oldPosY, null, 200, searchRoleData);
					}
					else
					{
						//不在本国就去边境，然后去目标国家
						npcData = MonsterDataManager.getData(NpcCfgData.countryTransNPCId);
						if (npcData == null)
							return;
						sceneRole = SceneManager.getSceneNpcByModelId(npcData.id);
						searchRoleData = new SearchRoleData();
						searchRoleData.searchId = npcData.id;
						searchRoleData.targetData = (sceneRole ? sceneRole.data as MonsterData : null);
						npcPos = MonsterDataManager.getMonsterPosition(npcData);
						MainRoleSearchPathManager.walkToScene(npcData.sceneId, npcPos.x, npcPos.y, null, 200, searchRoleData);
					}
					break;
				case "labPointRefresh1": //军需官1
					if (CountryManager.isAtMyCountry())
						npcData = MonsterDataManager.getData(BiaoCfgData.refleshWangNpc); //在本国，直接去目标点刷新镖车
					else
						npcData = MonsterDataManager.getData(NpcCfgData.countryTransNPCId); //不在本国就去边境，然后去目标国家

					if (npcData == null)
						return;
					sceneRole = SceneManager.getSceneNpcByModelId(npcData.id);
					searchRoleData = new SearchRoleData();
					searchRoleData.searchId = npcData.id;
					searchRoleData.targetData = (sceneRole ? sceneRole.data as MonsterData : null);

					npcPos = MonsterDataManager.getMonsterPosition(npcData);
					MainRoleSearchPathManager.walkToScene(npcData.sceneId, npcPos.x, npcPos.y, function openPanel() : void
					{
						if( searchRoleData.targetData != null )
						{
							var targerId : Number = (searchRoleData.targetData ? searchRoleData.targetData.id : 0);
							var role : SceneRole = SceneManager.getScene().getSceneObjByID(targerId, SceneCharType.NPC) as SceneRole;
							SceneRoleSelectManager.selectedRole = role;
							AppManager.showAppNoHide(AppConstant.TASK_DIAILOG_FUNC_PANEL, targerId);
						}
					}, 200, searchRoleData);
					break;
				case "labPointRefresh2": //军需官2
					if (CountryManager.isAtMyCountry())
						npcData = MonsterDataManager.getData(BiaoCfgData.refleshYangNpc);
					else
						npcData = MonsterDataManager.getData(NpcCfgData.countryTransNPCId); //不在本国就去边境，然后去目标国家

					if (npcData == null)
						return;
					sceneRole = SceneManager.getSceneNpcByModelId(npcData.id);
					searchRoleData = new SearchRoleData();
					searchRoleData.searchId = npcData.id;
					searchRoleData.targetData = (sceneRole ? sceneRole.data as MonsterData : null);

					npcPos = MonsterDataManager.getMonsterPosition(npcData);
					MainRoleSearchPathManager.walkToScene(npcData.sceneId, npcPos.x, npcPos.y, function openPanel() : void
					{
						if( searchRoleData.targetData != null )
						{
							var targerId : Number = (searchRoleData.targetData ? searchRoleData.targetData.id : 0);
							var role : SceneRole = SceneManager.getScene().getSceneObjByID(targerId, SceneCharType.NPC) as SceneRole;
							SceneRoleSelectManager.selectedRole = role;
							AppManager.showAppNoHide(AppConstant.TASK_DIAILOG_FUNC_PANEL, targerId);
						}
					}, 200, searchRoleData);
					break;
				case "labPointComplete": //边境交镖处
					if (CountryManager.isAtMyCountry()) //在本国
						npcData = MonsterDataManager.getData(BiaoCfgData.completeNpc);
					else
						npcData = MonsterDataManager.getData(NpcCfgData.countryTransNPCId);

					if (npcData == null)
						return;

					npcPos = MonsterDataManager.getMonsterPosition(npcData);
					sceneRole = SceneManager.getSceneNpcByModelId(npcData.id);
					searchRoleData = new SearchRoleData();
					searchRoleData.searchId = npcData.id;
					searchRoleData.targetData = (sceneRole ? sceneRole.data as MonsterData : null);
					MainRoleSearchPathManager.walkToScene(npcData.sceneId, npcPos.x, npcPos.y, function openPanel() : void
					{
						if( searchRoleData.targetData != null )
						{
							var targerId : Number = (searchRoleData.targetData ? searchRoleData.targetData.id : 0);
							var role : SceneRole = SceneManager.getScene().getSceneObjByID(targerId, SceneCharType.NPC) as SceneRole;
							SceneRoleSelectManager.selectedRole = role;
							AppManager.showAppNoHide(AppConstant.TASK_DIAILOG_FUNC_PANEL, targerId);
						}
					}, 200, searchRoleData);
					break;
				default:
					break;
			}
		}

		/**
		 *  onMouseMove
		 *
		 */
		private function onMouseMove(name : String = "") : void
		{
			switch (name)
			{
				case "labPointRealTime": //镖车位置
					_skin.labPointRealTime.color = StaticValue.COLOR_CODE_16;
					break;
				case "labPointRefresh1": //军需官1
					_skin.labPointRefresh1.color = StaticValue.COLOR_CODE_16;
					break;
				case "labPointRefresh2": //军需官2
					_skin.labPointRefresh2.color = StaticValue.COLOR_CODE_16;
					break;
				case "labPointComplete": //边境交镖处
					_skin.labPointComplete.color = StaticValue.COLOR_CODE_16;
					break;
				default:
					break;
			}
		}

		/**
		 *  onMouseOut
		 *
		 */
		private function onMouseOut(name : String = "") : void
		{
			switch (name)
			{
				case "labPointRealTime": //镖车位置
					_skin.labPointRealTime.color = StaticValue.COLOR_CODE_15;
					break;
				case "labPointRefresh1": //军需官1
					_skin.labPointRefresh1.color = StaticValue.COLOR_CODE_15;
					break;
				case "labPointRefresh2": //军需官2
					_skin.labPointRefresh2.color = StaticValue.COLOR_CODE_15;
					break;
				case "labPointComplete": //边境交镖处
					_skin.labPointComplete.color = StaticValue.COLOR_CODE_15;
					break;
				default:
					break;
			}
		}
		
		/**
		 * 点击事件 
		 * @param target
		 * 
		 */		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			switch (target)
			{
				case _skin.btnGetOn://上车
					if( ReliveManager.curDieInfo )//人物死亡了
					{
						NoticeManager.showNotify( LanguageConfig.getText( LangYunBiao.YUN_BIAO_DEATH ) );
						return;
					}
					YunBiaoSender.requestUpOrDownFromBiao( true );
					break;
				case _skin.btnGetOff://下车
					if( _biaoData == null )
						return;
						
					var biaoSceneRole : SceneRole = SceneManager.getSceneObjByID(_biaoData.id) as SceneRole;
					if ( biaoSceneRole == null )
						return;
					
					var mathNum:int =Math.round( Math.random() * 100 + 200 );
					var pointX:int = biaoSceneRole.position.x + mathNum;
					var pointY:int = biaoSceneRole.position.z + mathNum;
					YunBiaoSender.requestUpOrDownFromBiao( false, pointX, pointY );
					break;
				case _skin.btnXun://巡回镖车
					onClick( "labPointRealTime" );
					break;
			}
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
