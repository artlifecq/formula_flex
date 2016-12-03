package com.rpgGame.app.ui.main.miniMap
{
	import com.game.engine3D.controller.CameraController;
	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.app.manager.MailManager;
	import com.rpgGame.app.manager.map.MapUnitDataManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.MailEvent;
	import com.rpgGame.core.events.MapEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.TranportsDataManager;
	import com.rpgGame.coreData.cfg.country.CountryNameCfgData;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.cfg.npc.NpcCfgData;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.info.map.EnumMapUnitType;
	import com.rpgGame.coreData.info.map.SceneData;
	import com.rpgGame.coreData.lang.LangMainUi;
	import com.rpgGame.coreData.role.MonsterBornData;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.mainui.map.MiniMapBarSkin;
	
	import starling.display.DisplayObject;
	import starling.display.Shape;
	import starling.display.Sprite3D;
	import starling.events.Event;

	/**
	 * 雷达小地图
	 * @author Wing
	 * @modifier L.L.M.Sunny
	 * 修改时间：2016-06-02 下午3:05:12
	 *
	 */
	public class MiniMapBar extends SkinUI
	{
		private var miniSkin : MiniMapBarSkin;

		private var _thumbailMap : ThumbnailMap;

		private var mapSpr : Sprite3D;
		private var _gTime : GameTimer;

		public function MiniMapBar()
		{
			miniSkin = new MiniMapBarSkin();
			super(miniSkin);
			initPanel();
		}

		//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//////////////////////                                         override
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		override public function dispose() : void
		{
			super.dispose();
		}

		override protected function onTouchTarget(target : DisplayObject) : void
		{
			switch (target)
			{
				case miniSkin.btnWorldMap:
					AppManager.showApp(AppConstant.WORLD_MAP_PANEL);
					break;
				case miniSkin.btnMail:
					AppManager.showApp(AppConstant.MAIL_PANEL);
					break;
				case miniSkin.btnRank:
					break;
				case miniSkin.btnClose:
					miniSkin.grpMap.removeFromParent(false);
					miniSkin.btnopen.visible = true;
					miniSkin.btnClose.visible = false;
					break;
				case miniSkin.btnopen:
					miniSkin.container.addChild(miniSkin.grpMap);
					miniSkin.btnopen.visible = false;
					miniSkin.btnClose.visible = true;
					break;
				case miniSkin.btnZhiNan:
					CameraController.lockedOnPlayerController.xDeg = 0;
					break;
				case miniSkin.decrement: //-
					miniSkin.scaleSlider.value -= 0.25;
					break;
				case miniSkin.increment: //+
					miniSkin.scaleSlider.value += 0.25;
					break;
			}
		}

		//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//////////////////////                                         public
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function resize(sWidth : int, sHeight : int) : void
		{
			x = sWidth - miniSkin.width;
			y = 0;
		}

		//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//////////////////////                                         private
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private function initPanel() : void
		{
			miniSkin.btnopen.visible = false;
			miniSkin.btnClose.visible = true;

			createMiniMap();

			TipTargetManager.show(miniSkin.btnMail, TargetTipsMaker.makeSimpleTextTips(LanguageConfig.getText(LangMainUi.MINI_MAP_MAIL_TIPS1), null, mailTips));
			EventManager.addEvent(MailEvent.ADD_MAIL_DATA, updateMailTips);

			if (ClientConfig.isBanShu)
			{
				miniSkin.btnYanJing.visible = false;
				miniSkin.btnShengYin.visible = false;
				miniSkin.btnShengYin0.visible = false;
				miniSkin.btnRank.visible = false;
				miniSkin.btnGuaji.visible = false;
				miniSkin.btnZhiNan.visible = false;
				miniSkin.labTime.visible = false;

				miniSkin.btnMail.x = miniSkin.btnGuaji.x;
				miniSkin.btnMail.y = miniSkin.btnGuaji.y;
			}
		}

		private function createMiniMap() : void
		{
			var mask : Shape = new Shape();
			mask.graphics.beginFill(0x00ff00);
			mask.graphics.drawRoundRect(0, 0, miniSkin.bg.width, miniSkin.bg.height, 5);
			mask.graphics.endFill();
			miniSkin.grpMap.addChildAt(mask, miniSkin.grpMap.getChildIndex(miniSkin.bg) + 1);

			_thumbailMap = new ThumbnailMap(this, ThumbnailMap.RadarMap, miniSkin.bg.width, miniSkin.bg.height, 1);
			miniSkin.grpMap.addChildAt(_thumbailMap, miniSkin.grpMap.getChildIndex(miniSkin.bg) + 1);
			_thumbailMap.mask = mask;

			miniSkin.scaleSlider.minimum = 0.75;
			miniSkin.scaleSlider.maximum = 1.25;
			miniSkin.scaleSlider.value = 1;
			miniSkin.scaleSlider.step = 0.25;
			miniSkin.scaleSlider.liveDragging = true;
			miniSkin.scaleSlider.addEventListener(Event.CHANGE, onScaleSliderChange);
			EventManager.addEvent(MapEvent.MAP_SWITCH_COMPLETE, onMapSwitchComplete);
		}

		private function startTimer() : void
		{
			if (_gTime == null)
			{
				_gTime = new GameTimer("MiniMapBar", 500);
				_gTime.onUpdate = onUpdate;
			}
			_gTime.start();
			onUpdate();
		}

		private function onUpdate() : void
		{
			var sceneSequence : int = MainRoleManager.actorInfo.sceneSequence;
			var countryName : String = CountryNameCfgData.getCountryNameById(sceneSequence);
			if(MapDataManager.currentScene)
			{
				miniSkin.labCityName.text = (countryName ? "【" + countryName + "】" : "") + MapDataManager.currentScene.name + "(" + int(MainRoleManager.actor.position.x) + "," + int(MainRoleManager.actor.position.z) + ")";
			}
		}

		private function onScaleSliderChange(e : Event) : void
		{
			_thumbailMap.mapScale = miniSkin.scaleSlider.value;
		}

		private function showMap() : void
		{
			var sceneData : SceneData = MapDataManager.currentScene;
			if (sceneData == null)
				return;
			_thumbailMap.showMap(sceneData.sceneId);
			_thumbailMap.openRoad();
			updateSceneUnits();
			startTimer();
		}

		private function onMapSwitchComplete() : void
		{
			showMap();
			var ctrName : String = CountryNameCfgData.getCountryNameById(MainRoleManager.actorInfo.sceneSequence);
			if (!ctrName)
				ctrName = "";
//			miniSkin.labCityName.htmlText =ctrName+ HtmlTextUtil.getBlueText("("+int(MainRoleManager.actorInfo.x)+","+int(MainRoleManager.actorInfo.y)+")");
		}

		private function updateSceneUnits() : void
		{
			var sceneData : SceneData = MapDataManager.currentScene;
			if (sceneData == null)
				return;
			var npcs : Vector.<MonsterBornData> = NpcCfgData.getSceneNpcDatas(sceneData.sceneId);
			var fixMonsters : Array = MonsterDataManager.getSceneMonsterDatas(sceneData.sceneId);
			var transports : Array = TranportsDataManager.getSceneTransportDatas(sceneData.sceneId, MainRoleManager.actorInfo.sceneSequence);
			_thumbailMap.updataData(fixMonsters, transports, npcs);
		}

		private function updateMailTips() : void
		{
			if (MailManager.hasFuJianNoGet())
			{
			}
		}

		private function mailTips() : Array
		{
			if (MailManager.hasUnReadMail())
			{
				return [LanguageConfig.getText(LangMainUi.MINI_MAP_MAIL_TIPS2)];
			}
			return [LanguageConfig.getText(LangMainUi.MINI_MAP_MAIL_TIPS3)];
		}

		override protected function onShow() : void
		{
			super.onShow();
			showMap();
			MapUnitDataManager.addReqReference("MiniMapBar", EnumMapUnitType.TYPE_OFFICER);
			MapUnitDataManager.addReqReference("MiniMapBar", EnumMapUnitType.TYPE_FAMILY_MEMBER);
			MapUnitDataManager.addReqReference("MiniMapBar", EnumMapUnitType.TYPE_COUNTRY_MEMBER);
			MapUnitDataManager.addReqReference("MiniMapBar", EnumMapUnitType.TYPE_ENEMY_MEMBER);
			MapUnitDataManager.addReqReference("MiniMapBar", EnumMapUnitType.TYPE_TEAMMATE);
		}

		override protected function onHide() : void
		{
			super.onHide();
			MapUnitDataManager.removeReqReference("MiniMapBar", EnumMapUnitType.TYPE_OFFICER);
			MapUnitDataManager.removeReqReference("MiniMapBar", EnumMapUnitType.TYPE_FAMILY_MEMBER);
			MapUnitDataManager.removeReqReference("MiniMapBar", EnumMapUnitType.TYPE_COUNTRY_MEMBER);
			MapUnitDataManager.removeReqReference("MiniMapBar", EnumMapUnitType.TYPE_ENEMY_MEMBER);
			MapUnitDataManager.removeReqReference("MiniMapBar", EnumMapUnitType.TYPE_TEAMMATE);
		}
	}
}
