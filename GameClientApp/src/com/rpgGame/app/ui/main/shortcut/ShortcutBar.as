package com.rpgGame.app.ui.main.shortcut {
    import com.game.engine3D.display.InterObject3D;
    import com.game.engine3D.scene.render.RenderUnit3D;
    import com.rpgGame.app.manager.RollManager;
    import com.rpgGame.app.manager.role.MainRoleManager;
    import com.rpgGame.core.events.society.SocietyEvent;
    import com.rpgGame.core.ui.SkinUI;
    import com.rpgGame.coreData.cfg.ClientConfig;
    import com.rpgGame.coreData.enum.JobEnum;
    import com.rpgGame.coreData.type.EffectUrl;
    
    import flash.geom.Point;
    
    import feathers.controls.UIAsset;
    
    import org.client.mainCore.manager.EventManager;
    import org.mokylin.skin.mainui.shortcut.shortcut_Skin;
    
    import starling.display.DisplayObject;
    import starling.display.Shape;
    import starling.display.Sprite;
    
    public class ShortcutBar extends SkinUI {
		
		private var skillBar : ShortcutSkillBar;
		
        private var _skin : shortcut_Skin;
		
		private var _jumpState:Vector.<UIAsset>;

		private var renderUint:RenderUnit3D;
        
        public function ShortcutBar() {
            this._skin = new shortcut_Skin();
            super(this._skin);
			
			init();
        }
		
		private function useJump():void
		{
			var index:int=0;
			while(index<3){
				if(_jumpState[index].visible){
					_jumpState[index].visible=false;
					break;
				}
				index++;
			}
		}
		
		private function init() : void
		{
			
			skillBar = new ShortcutSkillBar(this);
			//skillBar.layerBatch = true;
//			_skin.grpTopGrids.visible = false;
			this._skin.Icons.addChild(skillBar);
//			skillBar.x = _skin.grpTopGrids.x;
//			skillBar.y = _skin.grpTopGrids.y;
			
			//			_shortcutMessageBar = new ShortcutMessageBar();
			//			addChild(_shortcutMessageBar);
			//			_shortcutMessageBar.x = int((_skin.width - _shortcutMessageBar.barWidth) * 0.5) + 350;
			//			_shortcutMessageBar.y = _shortcutMessageBar.barHeight - 90;
			
//			_buffListBar = new BuffListBar(MainRoleManager.actor, IcoSizeEnum.SIZE_46, GridBGType.GRID_SIZE_46, 55, 55, 15, 15, true);
//			addChild(_buffListBar);
//			_buffListBar.show();
//			_buffListBar.x = int((_skin.width - _buffListBar.barWidth) * 0.5);
//			_buffListBar.y = _buffListBar.barHeight - 120;
//			
//			Fac_skinl.backpackBtn = _skin.btnBackpack;
//			_skin.botBgBar.touchable = false;
//			_skin.botBgBar.touchAcross = true;
			
			initFanGunDis();
			
			initExp();
			addSheHuiTab();
			
			addEft();
			
			this._skin.jingzhen_yijia.visible=MainRoleManager.actorInfo.job==JobEnum.ROLE_3_TYPE;
			
			if (!ClientConfig.isBanShu)
			{				
//				TipTargetManager.show(_skin.btnBackpack, TargetTipsMaker.makeSimpleTextTips("背包<br/>快捷键：B"));
//				TipTargetManager.show(_skin.btnRole, TargetTipsMaker.makeSimpleTextTips("人物<br/>快捷键：C"));
//				TipTargetManager.show(_skin.btnHaoYou, TargetTipsMaker.makeSimpleTextTips("好友<br/>快捷键：F"));
//				TipTargetManager.show(_skin.btnZudui, TargetTipsMaker.makeSimpleTextTips("队伍<br/>快捷键：P"));
//				TipTargetManager.show(_skin.btnSheHui, TargetTipsMaker.makeSimpleTextTips("帮派"));
//				
//				TipTargetManager.show(_skin.btnTask, TargetTipsMaker.makeSimpleTextTips("任务<br/>快捷键：L"));
//				TipTargetManager.show(_skin.btnSpell, TargetTipsMaker.makeSimpleTextTips("技能<br/>快捷键：V"));
//				TipTargetManager.show(_skin.btnMount, TargetTipsMaker.makeSimpleTextTips("坐骑<br/>快捷键：N"));
//				TipTargetManager.show(_skin.btnChengJiu, TargetTipsMaker.makeSimpleTextTips("社会<br/>快捷键：J"));
//				TipTargetManager.show(_skin.btnSheHui, TargetTipsMaker.makeSimpleTextTips("装备<br/>快捷键：Q"));
//				TipTargetManager.show(_skin.btnShangDian, TargetTipsMaker.makeSimpleTextTips("商店<br/>快捷键：O"));
			}
			
			EventManager.addEvent(SocietyEvent.SOCIETY_APPROVE_CHANGE, addSheHuiTab);
			
			//			if(ClientConfig.isStable)
			//			{
			//				_skin.btnMount.visible = false;
			//			}
		}
		
		private function addEft():void
		{
			var hp3D:InterObject3D= this.playInter3DAt(ClientConfig.getEffect(EffectUrl.XUE_TIAO_HONG),0,0,0);
			hp3D.touchable=false;
			renderUint=RenderUnit3D(hp3D.baseObj3D);
			renderUint.setAddedCallBack(onAddHpEft,hp3D);
		}
		
		private function onAddHpEft(hp3D:InterObject3D,renderUint:RenderUnit3D):void
		{
			renderUint.removeAddedCallBack(onAddHpEft);
			
			renderUint.scaleX=renderUint.scaleY=this._skin.left_xuecao.width/270;
			hp3D.x=this._skin.left_xuecao.x+17;
			hp3D.y=this._skin.left_xuecao.y+this._skin.left_xuecao.height-12;
			this._skin.left_xuecao.visible=false;			
			
			var sp:Sprite=new Sprite();
			sp.graphics.beginFill(0xff0000);
			sp.graphics.drawCircle(0,0,10);
            sp.graphics.endFill();
			sp.x=110;
			sp.y=50;
			hp3D.mask=sp;
			this.addChild(sp);
		}
		
		private function initFanGunDis():void
		{
			_jumpState=new Vector.<UIAsset>();
			_jumpState.push(_skin.fangun_n3);
			_jumpState.push(_skin.fangun_n2);
			_jumpState.push(_skin.fangun_n1);
            EventManager.addEvent(RollManager.EVENT_UPDATE, onRollUpdate);
            EventManager.addEvent(RollManager.EVENT_STARTCD, onRollStartCd);
            EventManager.addEvent(RollManager.EVENT_ENDCD, onRollEndCd);
            EventManager.addEvent(RollManager.EVENT_UPDATECD, onRollUpdateCd);
            EventManager.addEvent(RollManager.EVENT_UPDATEUSECD, onRollUpdateUseCd);

            var _mask : Shape = new Shape();
		}

        private function onRollUpdate(times : int) : void {
            times = 3 - times;
            for (var i : int = 0; i < 3; ++i) {
                _jumpState[i].visible = i >= times;
            }
        }

        private function onRollStartCd() : void {
            this._skin.lbl_times.text = "15s";
        }

        private function onRollEndCd() : void {
            this._skin.lbl_times.text = "0s";
        }

        private function onRollUpdateCd(useTime : int) : void {
            this._skin.lbl_times.text = useTime + "s";
        }

        private function onRollUpdateUseCd(useTime : int) : void {
            this._skin.lbl_times.text = (15 - useTime) + "s";
        }
		
		public function getBtnGlobalPos(btnName : String) : Point
		{
			if (btnName == null || btnName == "")
				return null;
			var dis : DisplayObject = _skin[btnName];
			if (dis && dis.parent)
			{
				return dis.parent.localToGlobal(new Point(dis.x + 5, dis.y + 5));
			}
			return null;
		}
		
		private function initExp() : void
		{
//			expKArr = [];
//			
//			expKArr.push(_skin.imgExpK1, _skin.imgExpK2, _skin.imgExpK3, _skin.imgExpK4, _skin.imgExpK5, _skin.imgExpK6, _skin.imgExpK7, _skin.imgExpK8, _skin.imgExpK9);
//			
//			changeExp();
//			EventManager.addEvent(MainPlayerEvent.MAXEXP_CHANGE, changeExp);
//			EventManager.addEvent(MainPlayerEvent.NOWEXP_CHANGE, changeExp);
//			
//			TipTargetManager.show(_skin.imgExpBg, TargetTipsMaker.makeSimpleTextTips("经验：$/$($%)", null, getExp));
		}
		
		/**
		 * 经验TIPS
		 * @return
		 *
		 */
		private function getExp() : Array
		{
			return [MainRoleManager.actorInfo.curExp, MainRoleManager.actorInfo.maxExp, (MainRoleManager.actorInfo.curExp / MainRoleManager.actorInfo.maxExp * 100).toFixed(2)];
		}
		
		private function changeExp() : void
		{
			var p : Number = MainRoleManager.actorInfo.curExp / MainRoleManager.actorInfo.maxExp;
			if (p > 1)
				p = 1;
			
//			_skin.imgExp.width = p * expWidth;
			
			//shortcutSkin.imgCurEffect.x = shortcutSkin.imgExp.x + shortcutSkin.imgExp.width - shortcutSkin.imgCurEffect.width / 2;
		}
		
		private function resizeExp(sWidth : int, sHeight : int) : void
		{
//			expWidth = sWidth - 42;
//			
//			_skin.imgExpBg.width = sWidth;
//			_skin.imgExpBg.x = (_skin.width - sWidth) / 2;
//			_skin.imgExp.x = _skin.imgExpBg.x + 21;
			
			sortExp();
			
			changeExp();
		}
		
		private function sortExp() : void
		{
//			var d : int = expWidth / 10;
//			var len : int = expKArr.length;
//			var startX : int = _skin.imgExp.x;
//			for (var i : int = 0; i < len; i++)
//			{
//				expKArr[i].x = int(startX + d * (i + 1));
//			}
		}
		
		override protected function onTouchTarget(target : DisplayObject) : void
		{
			switch (target)
			{
//				case _skin.btnBackpack://背包
//					AppManager.showApp(AppConstant.BACK_PACK_PANEL);
//					break;
//				case _skin.btnRole://人物
//					AppManager.showApp(AppConstant.ROLE_PANEL);
//					break;
//				case _skin.btnHaoYou://好友
//					AppManager.showApp(AppConstant.FRIEND_PANEL);
//					break;
//				case _skin.btnZudui://组队
//					AppManager.showApp(AppConstant.TEAM_PANEL);
//					break;
//				case _skin.btnShangDian://商店
//					AppManager.showApp(AppConstant.SHOP_SYSTEM_PANEL);
//					break;
//				case _skin.btnTask://任务
//					AppManager.showApp(AppConstant.TASK_PANEL);
//					break;
//				case _skin.btnSheHui://装备
//					AppManager.showApp(AppConstant.EQUIP_CHANGE);
//					break;
//				case _skin.btnMount://坐骑
//					if (MainRoleManager.actorInfo.level < int(LanguageConfig.getText(LangMount.MOUNT_TIP_95))) //等级条件
//					{
//						NoticeManager.showNotify(LangMount.MOUNT_CMDLISTENER_FAILD_120);
//						return;
//					}
//					MountManager.onCheckOpenPanelCondition(true);
//					AppManager.showApp(AppConstant.MOUNT_PANEL);
//					break;
//				case _skin.btnSpell://技能
//					AppManager.showApp(AppConstant.SPELL_PANEL);
//					break;
//				//				case _skin.btnGm:
//				//					AppManager.showApp(AppConstant.GM_PANEL);
//				//					break;
//				case _skin.btnChengJiu://国家
//					AppManager.showApp(AppConstant.COUNTRY_PANEL);
//					break;
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
			//				PromptUtil.addTabIco(PromptUtil.TAB_PRIZE, _skin.btnSheHui);
			//			}
			//			else
			//			{
			//				PromptUtil.removeTabIco(PromptUtil.TAB_PRIZE, _skin.btnSheHui);
			//			}
		}
		
		//		public function get shortcutMessageBar() : ShortcutMessageBar
		//		{
		//			return _shortcutMessageBar;
		//		}
        
        public function resize(w : int, h : int) : void {
            this.x = (w - this._skin.width) >> 1;
            this.y = h - this._skin.height;
            CONFIG::netDebug{
                NetDebug.LOG("[ShortcutBar] [resize] x:" + this.x + ", y:" + this.y + ", w:" + this._skin.width + ", h:" + this._skin.height);
            }
        }
    }
}
