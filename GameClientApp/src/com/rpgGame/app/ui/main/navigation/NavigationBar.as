package com.rpgGame.app.ui.main.navigation {
    import com.rpgGame.app.sender.ItemSender;
    import com.rpgGame.core.app.AppConstant;
    import com.rpgGame.core.app.AppManager;
    import com.rpgGame.core.events.ItemEvent;
    import com.rpgGame.core.manager.tips.TargetTipsMaker;
    import com.rpgGame.core.manager.tips.TipTargetManager;
    import com.rpgGame.core.ui.SkinUI;
    import com.rpgGame.coreData.cfg.ClientConfig;
    import com.rpgGame.coreData.cfg.item.ItemContainerID;
    
    import gs.TweenLite;
    import gs.easing.Expo;
    
    import org.client.mainCore.manager.EventManager;
    import org.mokylin.skin.mainui.navigation.navigation_main_Skin;
    
    import starling.display.DisplayObject;
    
    public class NavigationBar extends SkinUI {
        private var _skin : navigation_main_Skin;
        
        private var _tween : TweenLite;
        
        private var _normalN1X : int;
        private var _normalN1W : int;
        private var _gapN1X : int;
        
        public function NavigationBar() {
            this._skin = new navigation_main_Skin();
            super(this._skin);
            
            this._gapN1X = this._skin.btns.x;
			
			this._skin.btns.parent.setChildIndex(this._skin.btns,0);
            this.setState(true);
			
			_skin.qi_bg.visible=false;
			_skin.qi_mc.visible=false;
			_skin.qi_mc.gotoAndStop("m");
			
			if (!ClientConfig.isBanShu)
			{
				TipTargetManager.show(_skin.btn_juese, TargetTipsMaker.makeSimpleTextTips("角色<br/>快捷键：C"));
				TipTargetManager.show(_skin.btn_beibao, TargetTipsMaker.makeSimpleTextTips("背包<br/>快捷键：B"));
				TipTargetManager.show(_skin.btn_zuoqi, TargetTipsMaker.makeSimpleTextTips("坐骑<br/>快捷键：V"));
				TipTargetManager.show(_skin.btn_zhuangbei, TargetTipsMaker.makeSimpleTextTips("装备<br/>快捷键：P"));
				TipTargetManager.show(_skin.btn_wuxue, TargetTipsMaker.makeSimpleTextTips("武学<br/>快捷键：J"));
				TipTargetManager.show(_skin.btn_banghui, TargetTipsMaker.makeSimpleTextTips("帮会<br/>快捷键：O"));
				TipTargetManager.show(_skin.btn_shangcheng, TargetTipsMaker.makeSimpleTextTips("商城<br/>快捷键：O"));
			}
			
			if(!ItemSender.isReqPack){
				ItemSender.getItemsByType(ItemContainerID.BackPack);
			}
			
			EventManager.addEvent(ItemEvent.LEFT_GRID_CHANG,showLeftGridState);
        }
		
		private function showLeftGridState(leftGrid:int):void
		{
			if(leftGrid<=5){
				_skin.qi_bg.visible=true;
				_skin.qi_mc.visible=true;
				if(leftGrid==0){
					_skin.qi_mc.gotoAndStop("m");
				}else{
					_skin.qi_mc.gotoAndStop(leftGrid.toString());
				}
			}else{
				_skin.qi_bg.visible=false;
				_skin.qi_mc.visible=false;
				_skin.qi_mc.gotoAndStop("m");
			}
		}		
        
        public function resize(w : int, h : int) : void {
            this.x = w - this._skin.width;
            this.y = h - this._skin.height;
        }
        
        override protected function onTouchTarget(target : DisplayObject) : void {
            CONFIG::netDebug {
                NetDebug.LOG("[MainUI] [NavigationBar] [onTouchTarget] target:" + target.name);
            }
            switch (target) {
                case this._skin.btn_open:
                    // 打开
                    this.setState(true);
                    break;
                case this._skin.btn_close:
                    // 关闭
                    this.setState(false);
                    break;
                case this._skin.btn_beibao:
                case this._skin.btn_juese:
                    AppManager.showApp(AppConstant.ROLE_PANEL);
                    break;
                case this._skin.btn_wuxue:
                    AppManager.showApp(AppConstant.SKILL_PANL);
                    break;
                case this._skin.btn_zhuangbei:
                    AppManager.showApp(AppConstant.EQUIP_PANL);
                    break;
            }
        }
        
        private function setState(isOpen : Boolean) : void {
            if (this._tween) {
                this._tween.kill();
            }
            var targetX : int = 0;
            if (isOpen) {
                targetX = this._gapN1X;
            } else {
                targetX = this.width + this._gapN1X;
            }
            CONFIG::netDebug {
                NetDebug.LOG("[NavigationNar] [setState] isOpen:" + isOpen + ", targetX:" + targetX);
            }
            this._tween = TweenLite.to(this._skin.btns, 0.5, {x : targetX,ease:Expo.easeIn});
            this._skin.btn_close.visible = isOpen;
            this._skin.btn_open.visible = !isOpen;
        }
    }
}