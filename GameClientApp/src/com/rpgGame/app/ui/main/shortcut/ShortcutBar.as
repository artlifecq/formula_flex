package com.rpgGame.app.ui.main.shortcut
{
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.events.society.SocietyEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.lang.LangMount;
	import com.rpgGame.coreData.type.item.GridBGType;
	
	import flash.geom.Point;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.mainui.shortcut.ShortcutSkin;
	
	import starling.display.DisplayObject;

	/**
	 * 主界面底部主工具栏
	 * @author wewell
	 */
	public class ShortcutBar extends SkinUI
	{
		private var skillBar : ShortcutSkillBar;
//		/**
//		 *  消息快捷
//		 */
//		private var _shortcutMessageBar : ShortcutMessageBar;
		private var _buffListBar : BuffListBar;
		private var skin : ShortcutSkin;
		private var expWidth : int;

		private var expKArr : Array;

		public function ShortcutBar()
		{
			skin = new ShortcutSkin();
			super(skin);
			init();
		}

		private function init() : void
		{
			skillBar = new ShortcutSkillBar(this);
			//skillBar.layerBatch = true;
			skin.grpTopGrids.visible = false;
			this.addChild(skillBar);
			skillBar.x = skin.grpTopGrids.x;
			skillBar.y = skin.grpTopGrids.y;

//			_shortcutMessageBar = new ShortcutMessageBar();
//			addChild(_shortcutMessageBar);
//			_shortcutMessageBar.x = int((skin.width - _shortcutMessageBar.barWidth) * 0.5) + 350;
//			_shortcutMessageBar.y = _shortcutMessageBar.barHeight - 90;

			_buffListBar = new BuffListBar(MainRoleManager.actor, IcoSizeEnum.SIZE_46, GridBGType.GRID_SIZE_46, 55, 55, 15, 15, true);
			addChild(_buffListBar);
			_buffListBar.show();
			_buffListBar.x = int((skin.width - _buffListBar.barWidth) * 0.5);
			_buffListBar.y = _buffListBar.barHeight - 120;

			FaceUtil.backpackBtn = skin.btnBackpack;
			skin.botBgBar.touchable = false;
			skin.botBgBar.touchAcross = true;

			initExp();
			addSheHuiTab();

			if (!ClientConfig.isBanShu)
			{
				TipTargetManager.show(skin.btnBackpack, TargetTipsMaker.makeSimpleTextTips("背包$", null, onlift));
				TipTargetManager.show(skin.btnRole, TargetTipsMaker.makeSimpleTextTips("人物<br/>快捷键：C"));
				TipTargetManager.show(skin.btnHaoYou, TargetTipsMaker.makeSimpleTextTips("好友<br/>快捷键：F"));
				TipTargetManager.show(skin.btnZudui, TargetTipsMaker.makeSimpleTextTips("队伍<br/>快捷键：P"));
				TipTargetManager.show(skin.btnSheHui, TargetTipsMaker.makeSimpleTextTips("帮派"));

				TipTargetManager.show(skin.btnTask, TargetTipsMaker.makeSimpleTextTips("任务<br/>快捷键：L"));
				TipTargetManager.show(skin.btnSpell, TargetTipsMaker.makeSimpleTextTips("技能<br/>快捷键：V"));
				TipTargetManager.show(skin.btnMount, TargetTipsMaker.makeSimpleTextTips("坐骑"));
				TipTargetManager.show(skin.btnChengJiu, TargetTipsMaker.makeSimpleTextTips("社会<br/>快捷键：J"));
				TipTargetManager.show(skin.btnSheHui, TargetTipsMaker.makeSimpleTextTips("装备<br/>快捷键：Q"));
				TipTargetManager.show(skin.btnShangDian, TargetTipsMaker.makeSimpleTextTips("商店<br/>快捷键：O"));
			}

			EventManager.addEvent(SocietyEvent.SOCIETY_APPROVE_CHANGE, addSheHuiTab);

			if (ClientConfig.isBanShu)
			{
				skin.btnMount.visible = false;
				skin.btnTask.visible = false;
				skin.btnRole.x = skin.btnTask.x;
				skin.btnRole.y = skin.btnTask.y;

				skin.btnSheHui.visible = false;
				skin.btnShangDian.visible = false;
			}
			if(ClientConfig.isStable)
			{
				skin.btnMount.visible = false;
			}
		}

		public function resize(sWidth : int, sHeight : int) : void
		{
			skin.botBgBar.width = sWidth;
			skin.botBgBar.x = (skin.width - sWidth) / 2;

			this.x = int((sWidth - skin.width) / 2);
			this.y = int(sHeight - skin.height); //透明像素引起的偏差

			resizeExp(sWidth, sHeight);
		}

		public function onlift() : Array
		{
			return ["<br/>快捷键：B"];
		}

		public function getBtnGlobalPos(btnName : String) : Point
		{
			if (btnName == null || btnName == "")
				return null;
			var dis : DisplayObject = skin[btnName];
			if (dis && dis.parent)
			{
				return dis.parent.localToGlobal(new Point(dis.x + 5, dis.y + 5));
			}
			return null;
		}

		private function initExp() : void
		{
			expKArr = [];

			expKArr.push(skin.imgExpK1, skin.imgExpK2, skin.imgExpK3, skin.imgExpK4, skin.imgExpK5, skin.imgExpK6, skin.imgExpK7, skin.imgExpK8, skin.imgExpK9);

			changeExp();
			EventManager.addEvent(MainPlayerEvent.MAXEXP_CHANGE, changeExp);
			EventManager.addEvent(MainPlayerEvent.NOWEXP_CHANGE, changeExp);

			TipTargetManager.show(skin.imgExpBg, TargetTipsMaker.makeSimpleTextTips("经验：$/$($%)", null, getExp));
		}

		/**
		 * 经验TIPS
		 * @return
		 *
		 */
		private function getExp() : Array
		{
			return [MainRoleManager.actorInfo.curExp, MainRoleManager.actorInfo.upgradeExp, (MainRoleManager.actorInfo.curExp / MainRoleManager.actorInfo.upgradeExp * 100).toFixed(2)];
		}

		private function changeExp() : void
		{
			var p : Number = MainRoleManager.actorInfo.curExp / MainRoleManager.actorInfo.upgradeExp;
			if (p > 1)
				p = 1;

			skin.imgExp.width = p * expWidth;

			//shortcutSkin.imgCurEffect.x = shortcutSkin.imgExp.x + shortcutSkin.imgExp.width - shortcutSkin.imgCurEffect.width / 2;
		}

		private function resizeExp(sWidth : int, sHeight : int) : void
		{
			expWidth = sWidth - 42;

			skin.imgExpBg.width = sWidth;
			skin.imgExpBg.x = (skin.width - sWidth) / 2;
			skin.imgExp.x = skin.imgExpBg.x + 21;

			sortExp();

			changeExp();
		}

		private function sortExp() : void
		{
			var d : int = expWidth / 10;
			var len : int = expKArr.length;
			var startX : int = skin.imgExp.x;
			for (var i : int = 0; i < len; i++)
			{
				expKArr[i].x = int(startX + d * (i + 1));
			}
		}

		override protected function onTouchTarget(target : DisplayObject) : void
		{
			switch (target)
			{
				case skin.btnBackpack:
					AppManager.showApp(AppConstant.BACK_PACK_PANEL);
					break;
				case skin.btnRole:
					AppManager.showApp(AppConstant.ROLE_PANEL);
					break;
				case skin.btnHaoYou:
					AppManager.showApp(AppConstant.FRIEND_PANEL);
					break;
				case skin.btnZudui:
					AppManager.showApp(AppConstant.TEAM_PANEL);
					break;
				case skin.btnShangDian:
					AppManager.showApp(AppConstant.SHOP_SYSTEM_PANEL);

					break;
				case skin.btnTask:
					AppManager.showApp(AppConstant.TASK_PANEL);
					break;
				case skin.btnSheHui:
					AppManager.showApp(AppConstant.EQUIP_CHANGE);
					break;
				case skin.btnMount:
					var lv : int = int(LanguageConfig.getText(LangMount.MOUNT_TIP_95));
					if (MainRoleManager.actorInfo.level < lv)
					{
						NoticeManager.showNotify(LangMount.MOUNT_CMDLISTENER_FAILD_120);
						return;
					}
					if (AppManager.isAppInScene(AppConstant.MOUNT_CHANGE_PANEL))
					{
						NoticeManager.showNotify(LangMount.MOUNT_CMDLISTENER_FAILD_121);
						return;
					}
					if (AppManager.isAppInScene(AppConstant.MOUNT_AUTHENTICATE_PANEL))
					{
						NoticeManager.showNotify(LangMount.MOUNT_CMDLISTENER_FAILD_122);
						return;
					}
					if (AppManager.isAppInScene(AppConstant.MOUNT_BREED_PANEL))
					{
						NoticeManager.showNotify(LangMount.MOUNT_CMDLISTENER_FAILD_123);
						return;
					}
					if (AppManager.isAppInScene(AppConstant.MOUNT_INHERIT_PANEL))
					{
						NoticeManager.showNotify(LangMount.MOUNT_CMDLISTENER_FAILD_120);
						return;
					}
					AppManager.showApp(AppConstant.MOUNT_PANEL);
					break;
				case skin.btnSpell:
					AppManager.showApp(AppConstant.SPELL_PANEL);
					break;
//				case skin.btnGm:
//					AppManager.showApp(AppConstant.GM_PANEL);
//					break;
				case skin.btnChengJiu:
					AppManager.showApp(AppConstant.COUNTRY_PANEL);
					break;
			}
		}




		/**
		 * 是否显示有人申请入家族的提示
		 *
		 */
		private function addSheHuiTab() : void
		{
//			if (SocietyManager.hasSomeRequest())
//			{
//				PromptUtil.addTabIco(PromptUtil.TAB_PRIZE, skin.btnSheHui);
//			}
//			else
//			{
//				PromptUtil.removeTabIco(PromptUtil.TAB_PRIZE, skin.btnSheHui);
//			}
		}

//		public function get shortcutMessageBar() : ShortcutMessageBar
//		{
//			return _shortcutMessageBar;
//		}


	}
}

