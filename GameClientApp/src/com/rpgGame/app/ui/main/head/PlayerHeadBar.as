package com.rpgGame.app.ui.main.head
{
	import com.game.engine3D.display.InterObject3D;
	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.app.display3D.InterAvatar3D;
	import com.rpgGame.app.manager.AvatarManager;
	import com.rpgGame.app.manager.MenuManager;
	import com.rpgGame.app.manager.TeamManager;
	import com.rpgGame.app.manager.mount.MountManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.ui.main.shortcut.BuffListBar;
	import com.rpgGame.app.utils.RoleFaceMaskEffectUtil;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.core.events.AvatarEvent;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.events.TeamEvent;
	import com.rpgGame.core.events.country.CountryEvent;
	import com.rpgGame.core.events.mount.MountEvent;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.MouseListenerUtil;
	import com.rpgGame.core.utils.PKModeUtil;
	import com.rpgGame.coreData.cfg.GlobalSettingCfgData;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.res.AvatarResConfigSetData;
	import com.rpgGame.coreData.clientConfig.AvatarResConfig;
	import com.rpgGame.coreData.clientConfig.GlobalSetting;
	import com.rpgGame.coreData.configEnum.EnumGlobalSetting;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.team.TeamUnit;
	import com.rpgGame.coreData.lang.LangMount;
	import com.rpgGame.coreData.lang.LangTeam;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.type.TipType;
	import com.rpgGame.coreData.type.item.GridBGType;
	
	import flash.geom.Point;
	import flash.text.TextFormat;
	
	import feathers.controls.UIAsset;
	import feathers.controls.text.TextFieldTextRenderer;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.mainui.head.PlayerHeadBarSkin;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.Shape;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;

	public class PlayerHeadBar extends SkinUI
	{
		private var playerHeadSkin : PlayerHeadBarSkin;
		/** pk选择列表界面 **/
		private var _pkModelSelectView : PkModeSelectView;
		/** hp遮罩 **/
		private var bloodMask : Shape;
		/** mp遮罩 **/
		private var mpMask : Shape;
		/** buff列表栏 **/
		private var _buffListBar : BuffListBar;
		/** Mp值 **/
		private var _imgMpWidth : Number = 0;
		/** Hp值 **/
		private var _imgLifeWidth : Number = 0;
		/** 文本 **/
		private var _staticLabelRender : TextFieldTextRenderer;
		/** NPC模型 **/
		private var _avatar3D : InterAvatar3D;
		/** 坐骑繁育时长计时器 **/
		private var _gTime : GameTimer;
		/** 繁育时长 **/
		private var _breedString : String = "";

		public function PlayerHeadBar()
		{
			playerHeadSkin = new PlayerHeadBarSkin();
			super(playerHeadSkin);
//			playerHeadSkin.labHP.alignPivot("left","left");
			initPanel();
		}

		public function resize(sWidth : int, sHeight : int) : void
		{
			x = 0;
			y = 0; //20;
		}

		override protected function onTouchTarget(target : DisplayObject) : void
		{
			switch (target)
			{
				case playerHeadSkin.btnPk:
					shouModePanel();
//					if (pkModeSetPanel == null)
//						creatModePanel();
//
//					addChild(pkModeSetPanel);
//					pkModeSetPanel.showAndHidePanel();
					break;
			}
		}

		/**
		 * 显示pk列表界面
		 *
		 */
		private function shouModePanel() : void
		{
			if (_pkModelSelectView && _pkModelSelectView.parent)
			{
				_pkModelSelectView.parent.removeChild(_pkModelSelectView);
				_pkModelSelectView = null;
				return;
			}
			var point : Point = localToGlobal(new Point(playerHeadSkin.btnPk.x, playerHeadSkin.btnPk.y + playerHeadSkin.btnPk.height));
			if (_pkModelSelectView == null)
			{
				_pkModelSelectView = new PkModeSelectView();
			}
			_pkModelSelectView.x = point.x;
			_pkModelSelectView.y = point.y;
			_pkModelSelectView.setLab();
			StarlingLayerManager.hintUILayer.addChild(_pkModelSelectView);
			if (stage)
				stage.addEventListener(TouchEvent.TOUCH, onTouchStage);
		}


		protected function onTouchStage(event : TouchEvent) : void
		{
			var touchs : Vector.<Touch> = event.touches;
			var i : int = 0;
			var len : int = touchs.length;
			var touch : Touch;
			for (; i < len; i++)
			{
				touch = touchs[i];
				if (touch.target == playerHeadSkin.btnPk)
					return;
				if (touch.phase == TouchPhase.BEGAN)
				{
					if (_pkModelSelectView && _pkModelSelectView.parent)
					{
						_pkModelSelectView.parent.removeChild(_pkModelSelectView);
						_pkModelSelectView = null;
					}
					if (stage)
						stage.removeEventListener(TouchEvent.TOUCH, onTouchStage);
					return;
				}

			}
		}

//		/**
//		 * 创建模式设置面板
//		 *
//		 */
//		private function creatModePanel() : void
//		{
//			pkModeSetPanel = new PKModeSetPanelExt();
//			pkModeSetPanel.x = playerHeadSkin.btnPk.x;
//			pkModeSetPanel.y = playerHeadSkin.btnPk.y + playerHeadSkin.btnPk.height;
//			addChild(pkModeSetPanel);
//		}

		//---------------------------------------
		/**
		 *初始化
		 *
		 */
		private function initPanel() : void
		{
			playerHeadSkin.imgHeadIco.visible = false;
			playerHeadSkin.btnVip.visible = false;
			_imgMpWidth = playerHeadSkin.imgMp.width;
			_imgLifeWidth = playerHeadSkin.imgLife.width;

			bloodMask = addMask(playerHeadSkin.imgLife);
			mpMask = addMask(playerHeadSkin.imgMp);

			_buffListBar = new BuffListBar(MainRoleManager.actor, IcoSizeEnum.SIZE_22, GridBGType.GRID_SIZE_22, 25, 25, 10, 10, false);
			addChild(_buffListBar);
			_buffListBar.show();
			_buffListBar.x = 80;
			_buffListBar.y = 80;

			playerHeadSkin.imgBreed.visible = false;
			TipTargetManager.show(playerHeadSkin.imgBreed, TargetTipsMaker.makeSimpleTextTips(LanguageConfig.getText(LangMount.MOUNT_TIP_73) + getMountBreedString()));

			playerHeadSkin.btnPk.labelFactory = function() : TextFieldTextRenderer
			{
				var labelRender : TextFieldTextRenderer = new TextFieldTextRenderer();
				labelRender.textFormat = new TextFormat();
				labelRender.textFormat.color = 0xFFFFFF;
				_staticLabelRender = labelRender;
				updatePkMode();
				return labelRender;
			}
			_avatar3D = new InterAvatar3D();
			var setting : GlobalSetting = GlobalSettingCfgData.getSettingInfo(EnumGlobalSetting.DEFAULT_SETTING);
			if (setting)
			{
				_avatar3D.x = RoleFaceMaskEffectUtil.getFaceOffsetX(setting.headFaceOffset) + playerHeadSkin.bg.x;
				_avatar3D.y = RoleFaceMaskEffectUtil.getFaceOffsetY(setting.headFaceOffset) + playerHeadSkin.bg.y;
			}
			else
			{
				_avatar3D.x = -90;
				_avatar3D.y = -110;
			}
			addChild3D(_avatar3D);
			setChildIndex(_avatar3D, getChildIndex(playerHeadSkin.bg) + 1);

			updateName();
			updateLevel();
			updateLife();
//			updatePkMode();
			updateAvatar();
			initTips();
			mountBreedTimer();

			TipTargetManager.show(playerHeadSkin.btnPk, TargetTipsMaker.makeTips(TipType.PK_MODE_TIP, null));
			EventManager.addEvent(MainPlayerEvent.LEVEL_CHANGE, updateLevel);
			EventManager.addEvent(MainPlayerEvent.NOWHP_CHANGE, updateLife);
			EventManager.addEvent(MainPlayerEvent.STAT_CHANGE, updateStat);
			EventManager.addEvent(MainPlayerEvent.NOWMP_CHANGE, updateMp);
			EventManager.addEvent(MainPlayerEvent.PK_MODE_CHANGE, updatePkMode);
			EventManager.addEvent(AvatarEvent.EQUIP_CHANGE, onEquipmentChange);
			EventManager.addEvent(CountryEvent.COUNTRY_SELF_TRANSFER_COUNTRY, onTransferCountry);
			EventManager.addEvent(TeamEvent.TEAM_PLAYER_TEAM_STATE_UPDATE, updateTeamItem);
			EventManager.addEvent(TeamEvent.TEAM_CAPTION_CHANGE, updateTeamItem);
			EventManager.addEvent(TeamEvent.TEAM_EXP_MODE, onCheckIcon);
			EventManager.addEvent(TeamEvent.TEAM_PICK_UP_MODE, onCheckIcon);
			MouseListenerUtil.addEventListener(playerHeadSkin.btnShang, onExpModeMouseClick);
			MouseListenerUtil.addEventListener(playerHeadSkin.btnJun, onExpModeMouseClick);
			MouseListenerUtil.addEventListener(playerHeadSkin.btnLie, onItemsModeMouseClick);
			MouseListenerUtil.addEventListener(playerHeadSkin.btnLun, onItemsModeMouseClick);
			MouseListenerUtil.addEventListener(playerHeadSkin.btnZi, onItemsModeMouseClick);
			EventManager.addEvent(MountEvent.MOUNT_BREED_TIME, mountBreedTimer);
		}

		/**
		 * 初始化tips
		 *
		 */
		private function initTips() : void
		{
			playerHeadSkin.btnJun.visible = false;
			playerHeadSkin.btnShang.visible = false;
			playerHeadSkin.btnLun.visible = false;
			playerHeadSkin.btnLie.visible = false;
			playerHeadSkin.btnZi.visible = false;
			playerHeadSkin.duiZhang.visible = false;

			TipTargetManager.show(playerHeadSkin.btnJun, TargetTipsMaker.makeSimpleTextTips(LanguageConfig.getText(LangTeam.TEAM_MODE_TIPS_1)));
			TipTargetManager.show(playerHeadSkin.btnShang, TargetTipsMaker.makeSimpleTextTips(LanguageConfig.getText(LangTeam.TEAM_MODE_TIPS_2)));
			TipTargetManager.show(playerHeadSkin.btnLun, TargetTipsMaker.makeSimpleTextTips(LanguageConfig.getText(LangTeam.TEAM_MODE_TIPS_3)));
			TipTargetManager.show(playerHeadSkin.btnLie, TargetTipsMaker.makeSimpleTextTips(LanguageConfig.getText(LangTeam.TEAM_MODE_TIPS_5)));
			TipTargetManager.show(playerHeadSkin.btnZi, TargetTipsMaker.makeSimpleTextTips(LanguageConfig.getText(LangTeam.TEAM_MODE_TIPS_4)));
		}

		/**
		 * 更新队伍数据
		 * @param membInfo
		 *
		 */
		private function updateTeamItem(membInfo : TeamUnit = null) : void
		{
			if (TeamManager.isHaveTeam() && TeamManager.isTeamLeader(MainRoleManager.actorID)) //有队伍，自己是队长
				updateModeVisible(true);
			else
				updateModeVisible(false);
		}

		/**
		 * 更新经验模式、拾取模式显示
		 * @param isVisibool
		 *
		 */
		private function updateModeVisible(isVisibool : Boolean) : void
		{
			playerHeadSkin.btnJun.visible = isVisibool;
			playerHeadSkin.btnShang.visible = isVisibool;
			playerHeadSkin.btnLun.visible = isVisibool;
			playerHeadSkin.btnLie.visible = isVisibool;
			playerHeadSkin.btnZi.visible = isVisibool;
			playerHeadSkin.duiZhang.visible = isVisibool;
		}

		/**
		 * 经验模式切换
		 *
		 */
		private function onExpModeMouseClick() : void
		{
			MenuManager.showMenu(TeamManager.MENUS_EXP_MODE, [MainRoleManager.actorID], int(Starling.current.nativeStage.mouseX + 5), int(Starling.current.nativeStage.mouseY + 5), 100);
		}

		/**
		 * 拾取模式切换
		 *
		 */
		private function onItemsModeMouseClick() : void
		{
			MenuManager.showMenu(TeamManager.MENUS_PICK_UP_MODE, [MainRoleManager.actorID], int(Starling.current.nativeStage.mouseX + 5), int(Starling.current.nativeStage.mouseY + 5), 100);
		}

		/**
		 * 检测队伍经验、拾取模式
		 *
		 */
		private function onCheckIcon() : void
		{
			if (TeamManager.isHaveTeam() && TeamManager.isTeamLeader(MainRoleManager.actorID)) //有队伍，自己是队长
			{
				switch (TeamManager.expIndex)
				{
					case 0:
						playerHeadSkin.btnJun.visible = true;
						playerHeadSkin.btnShang.visible = false;
						break;
					case 1:
						playerHeadSkin.btnJun.visible = false;
						playerHeadSkin.btnShang.visible = true;
						break;
					default:
						break;
				}

				switch (TeamManager.pickupIndex)
				{
					case 0:
						playerHeadSkin.btnLie.visible = false;
						playerHeadSkin.btnLun.visible = true;
						playerHeadSkin.btnZi.visible = false;
						break;
					case 1:
						playerHeadSkin.btnLie.visible = true;
						playerHeadSkin.btnLun.visible = false;
						playerHeadSkin.btnZi.visible = false;
						break;
					case 2:
						playerHeadSkin.btnLie.visible = false;
						playerHeadSkin.btnLun.visible = false;
						playerHeadSkin.btnZi.visible = true;
						break;
					default:
						break;
				}
			}
		}

		private function onTransferCountry() : void
		{
			updateName();
		}

		private function updateName() : void
		{
			var ctrName : String = "xqj";// CountryManager.getCountryName(MainRoleManager.actorInfo.countryId);
			if (!ctrName)
				ctrName = "";
			playerHeadSkin.labName.text = MainRoleManager.actorInfo.name + "【" + ctrName + "】";
		}

		/**
		 * 人物装备改变
		 * @param role
		 *
		 */
		private function onEquipmentChange(role : SceneRole) : void
		{
			if (!role || !role.usable)
				return;
			if (role.isMainChar)
			{
				updateAvatar();
			}
		}

		/**
		 * 获取一个遮罩
		 * @param target
		 * @return
		 *
		 */
		private function addMask(target : UIAsset) : Shape
		{
			var mask : Shape = new Shape();
			addChild(mask);
			mask.x = target.x;
			mask.y = target.y;
			mask.graphics.beginFill(0xf00ff0);
			mask.graphics.drawRect(0, 0, target.width, target.height);
			mask.graphics.endFill();
			target.mask = mask;
			return mask;
		}

		/**
		 * 更新NPC模型
		 * @param role
		 *
		 */
		private function updateAvatar() : void
		{
			var roleData : RoleData = new RoleData(0);
			roleData.avatarInfo.setBodyResID(MainRoleManager.actorInfo.avatarInfo.bodyResID, MainRoleManager.actorInfo.avatarInfo.bodyAnimatResID);
			roleData.avatarInfo.hairResID = MainRoleManager.actorInfo.avatarInfo.hairResID;
			
			_avatar3D.setRoleData(roleData);
			AvatarManager.updateAvatar(_avatar3D.curRole);

			var avatarResConfig : AvatarResConfig = AvatarResConfigSetData.getInfo(roleData.avatarInfo.bodyResID);
			if (avatarResConfig)
			{
				RoleFaceMaskEffectUtil.addHeadFaceMaskEffect(_avatar3D.curRole);
				_avatar3D.curRole.setScale(RoleFaceMaskEffectUtil.getFaceMaskScale(avatarResConfig.headFaceMask));
				_avatar3D.curRole.rotationY = RoleFaceMaskEffectUtil.getFaceMaskRotation(avatarResConfig.headFaceMask);
			}
			else
			{
				_avatar3D.curRole.setScale(1);
				_avatar3D.curRole.rotationY = 0;
				RoleFaceMaskEffectUtil.removeFaceMaskEffect(_avatar3D.curRole);
			}
			updateFadeAlphaRectPos();
		}

		override protected function onUpdateFadeAlphaRectPos(sr3D : InterObject3D, x : int, y : int) : void
		{
			super.onUpdateFadeAlphaRectPos(sr3D, x, y);
			var avatar3D : InterAvatar3D = sr3D as InterAvatar3D;
			if (avatar3D && avatar3D.curRole)
			{
				var roleData : RoleData = avatar3D.curRole.data as RoleData;
				var avatarResConfig : AvatarResConfig = AvatarResConfigSetData.getInfo(roleData.avatarInfo.bodyResID);
				if (avatarResConfig)
				{
					var fadeX : int = RoleFaceMaskEffectUtil.getFaceMaskX(avatarResConfig.headFaceMask);
					var fadeY : int = RoleFaceMaskEffectUtil.getFaceMaskY(avatarResConfig.headFaceMask);
					avatar3D.curRole.x = fadeX;
					avatar3D.curRole.y = fadeY;
					RoleFaceMaskEffectUtil.updateFadeAlphaRectPos(avatar3D.curRole, x + avatar3D.x, y + avatar3D.y);
				}
			}
		}

		/**
		 * 属性变化
		 *
		 */
		private function updateStat() : void
		{
			updateMp();
			updateLife();
		}

		/**
		 * 更新mp
		 * @param roleData
		 *
		 */
		private function updateMp(roleData : RoleData = null) : void
		{
			var p : Number = MainRoleManager.actorInfo.mp / MainRoleManager.actorInfo.totalStat.mana;
			if (p > 1)
				p = 1;
			mpMask.width = _imgMpWidth * p;
		}

		/**
		 * 刷新pk模式
		 *
		 */
		private function updatePkMode() : void
		{
			playerHeadSkin.btnPk.label = PKModeUtil.getPKModeInfo(MainRoleManager.actorInfo.pkMode);
			if (_staticLabelRender)
			{
				var color : int = PKModeUtil.getPKModeColor(MainRoleManager.actorInfo.pkMode);
				_staticLabelRender.textFormat.color = color;
			}
		}

		/**
		 * 更新hp
		 * @param roleData
		 *
		 */
		private function updateLife(roleData : RoleData = null) : void
		{
			var p : Number = MainRoleManager.actorInfo.hp / MainRoleManager.actorInfo.totalStat.life;
			if (p > 1)
				p = 1;
			bloodMask.width = _imgLifeWidth * p;
			playerHeadSkin.labHP.text = MainRoleManager.actorInfo.hp + "/" + MainRoleManager.actorInfo.totalStat.life;
		}

		/**
		 * 更新等级
		 *
		 */
		private function updateLevel() : void
		{
			playerHeadSkin.labLevel.number = MainRoleManager.actorInfo.level;
		}

		private function get pkModeSetPanel() : PkModeSelectView
		{
			return _pkModelSelectView;
		}

		private function set pkModeSetPanel(value : PkModeSelectView) : void
		{
			_pkModelSelectView = value;
		}

		/**
		 * 繁育时长
		 *
		 */
		private function mountBreedTimer() : void
		{
			if (_gTime == null)
			{
				_gTime = new GameTimer("PlayerHeadBar");
				_gTime.onUpdate = onUpdateTime;
			}
			_gTime.start();
		}

		/**
		 * 时间更新
		 *
		 */
		private function onUpdateTime() : void
		{
			//繁育时间
			var breedTimer : int = MountManager.getMountBreedTime();
			if (TipTargetManager.hasTipsEventListener(playerHeadSkin.imgBreed))
				TipTargetManager.remove(playerHeadSkin.imgBreed);

			TipTargetManager.show(playerHeadSkin.imgBreed, TargetTipsMaker.makeSimpleTextTips(LanguageConfig.getText(LangMount.MOUNT_TIP_73) + TimeUtil.timeFormatCH(breedTimer, 3)));
			playerHeadSkin.imgBreed.visible = true;
			if (breedTimer <= 0)
			{
				_breedString = "";
				playerHeadSkin.imgBreed.visible = false;
				if (_gTime != null)
				{
					_gTime.stop();
					_gTime = null;
				}
			}
		}

		/**
		 * 获取繁育倒计时长
		 * @return
		 *
		 */
		private function getMountBreedString() : String
		{
			return _breedString;
		}
	}
}
