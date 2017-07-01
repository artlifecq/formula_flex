package com.rpgGame.app.ui.main.navigation {
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.ui.main.buttons.IOpen;
	import com.rpgGame.app.ui.main.buttons.MainButtonManager;
	import com.rpgGame.core.events.FunctionOpenEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.ui.tip.RTNodeID;
	import com.rpgGame.coreData.cfg.FuncionBarCfgData;
	
	import flash.geom.Point;
	
	import gs.TweenLite;
	import gs.easing.Expo;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.mainui.navigation.navigation_main_Skin;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	public class NavigationBar extends SkinUI {
		private var _skin : navigation_main_Skin;
		
		private var _tween : TweenLite;
		
		private var _normalN1X : int;
		private var _normalN1W : int;
		private var _gapN1X : int;
		private var _lastLevel:int;
		private var _content:ContengGroup;
		
		public function NavigationBar() {
			this._skin = new navigation_main_Skin();
			super(this._skin);
			
			_content = new ContengGroup(_skin.width,_skin.height);
			this.addChildAt(_content,0);
			this.setState(true);
			EventManager.addEvent(FunctionOpenEvent.FUNCTIONOPENID,refeashButton);
			refeashButton();
			addNode(null,RTNodeID.MIANROLE,_content.buttonList[0]as DisplayObjectContainer,60,null,false);
		}
		
		private function refeashButton(data:*=null):void
		{
			var buttoninfos:Array = FuncionBarCfgData.getInfoListbyType(0);
			var length:int = buttoninfos.length;
			var index:int = 0;
			_content.reset();
			for(var i:int =0;i<length;i++)
			{
				var button:IOpen = MainButtonManager.getButtonBuyInfo(buttoninfos[i]);
				if(button!=null&&button.canOpen())
				{
					_content.addButton(button);
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
			_content.openState = isOpen;
			
			if(_content.isInitialized)
			{
				var targetX : int = 0;
				if (!isOpen) {
					targetX = this.width;
				} else {
					targetX = -this._content.width;
				}
				CONFIG::netDebug {
					NetDebug.LOG("[NavigationNar] [setState] isOpen:" + isOpen + ", targetX:" + targetX);
				}
					this._tween = TweenLite.to(_content, 0.5, {x : targetX,ease:Expo.easeIn});
			}	
			this._skin.btn_close.visible = isOpen;
			this._skin.btn_open.visible = !isOpen;
		}
		public function getBtnGlobalPos(btnName : String) : Point
		{
			var display:DisplayObject = _content.getChildByName(btnName);
			return display.localToGlobal(new Point(0,0));
		}
	}
}
