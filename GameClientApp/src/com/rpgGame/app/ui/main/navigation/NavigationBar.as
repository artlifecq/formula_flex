package com.rpgGame.app.ui.main.navigation {
    import com.rpgGame.app.manager.role.MainRoleManager;
    import com.rpgGame.app.ui.main.buttons.MainButtonBases;
    import com.rpgGame.core.events.MainPlayerEvent;
    import com.rpgGame.core.ui.SkinUI;
    import com.rpgGame.coreData.cfg.FuncionBarCfgData;
    import com.rpgGame.coreData.clientConfig.FunctionBarInfo;
    
    import flash.geom.Point;
    
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
        private var _lastLevel:int;
        public function NavigationBar() {
            this._skin = new navigation_main_Skin();
            super(this._skin);
            
            this._gapN1X = this._skin.btns.x;
			this._skin.btns.parent.setChildIndex(this._skin.btns,0);
			this.setState(true);
			EventManager.addEvent(MainPlayerEvent.STAT_CHANGE,createButton);
			createButton();
        }
		
		private function createButton():void
		{
			if(_lastLevel == MainRoleManager.actorInfo.totalStat.level)
				return ;
			_lastLevel == MainRoleManager.actorInfo.totalStat.level
			var buttoninfos:Array = FuncionBarCfgData.getInfoListbyType(0);
			this._skin.btns.removeChildren();
			for each(var info:FunctionBarInfo in buttoninfos)
			{
				var button:MainButtonBases = MainButtonBases.getButtonBuyInfo(info);
				if(button!=null&&button.canOpen())
				{
					this._skin.btns.addChild(button);
				}
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
		public function getBtnGlobalPos(btnName : String) : Point
		{
			var display:DisplayObject = _skin.btns.getChildByName(btnName);
			return display.localToGlobal(new Point(0,0));
		}
    }
}
