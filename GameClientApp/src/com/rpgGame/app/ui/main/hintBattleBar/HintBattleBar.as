package com.rpgGame.app.ui.main.hintBattleBar
{
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.HintEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.MouseListenerUtil;
	import com.rpgGame.coreData.cfg.StaticValue;
	
	import flash.text.TextFormat;
	
	import feathers.controls.Label;
	import feathers.controls.Scroller;
	import feathers.controls.text.Fontter;
	
	import gs.TweenLite;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.mainui.hintBattle.HintBattleBarSkin;
	
	import starling.display.DisplayObject;
	import starling.events.TouchEvent;
	
	import utils.TimerServer;

	/**
	 * 战斗提示
	 * @author luguozheng
	 * 
	 */	
	public class HintBattleBar extends SkinUI
	{
		private var hintBattleSkin:HintBattleBarSkin;
		private var _isShowHint:Boolean;
		
		private static const HIDE_BAR_WAIT_TIME : int = 3000;
		private static const HIDE_BAR_TIME : int = 3;
		
		private var isMouseIn : Boolean = false;
		
		public function HintBattleBar()
		{
			hintBattleSkin = new HintBattleBarSkin();
			super(hintBattleSkin);
			initBar();
		}
		
		private function initBar():void
		{
			hintBattleSkin.scrollContainer.verticalScrollBarPosition = Scroller.VERTICAL_SCROLL_BAR_POSITION_RIGHT;
			hintBattleSkin.zhanbao.visible = false;
			setTextF();
			
			isShowHint = true;
			
			EventManager.addEvent( HintEvent.BATTLE_HINT, addMsg );
			
			MouseListenerUtil.addEventListener(hintBattleSkin.scrollContainer,null,mouseOver,mouseOut);
		}		
		
		private function mouseOut():void
		{
			TimerServer.remove(hideBar);
			TimerServer.add(hideBar,HIDE_BAR_WAIT_TIME);
			isMouseIn = false;
		}
		
		private function mouseOver():void
		{
			isMouseIn = true;
			showBar();
		}
		
		private function hideBar():void
		{
			TweenLite.to(hintBattleSkin.bg,HIDE_BAR_TIME,{alpha:0.01});
			TweenLite.to(hintBattleSkin.scrollContainer,HIDE_BAR_TIME,{alpha:0.01});
		}
		
		private function showBar():void
		{
			TimerServer.remove(hideBar);
			TweenLite.killTweensOf(hintBattleSkin.bg);
			TweenLite.killTweensOf(hintBattleSkin.scrollContainer);
			hintBattleSkin.bg.alpha = 1;
			hintBattleSkin.scrollContainer.alpha = 1;
		}
		
		override protected function onShow():void
		{
			mouseOut();
		}
		/**
		 * 设置文本
		 * 
		 */
		private function setTextF():void
		{
			
		}
		
		public function resize(sWidth:int, sHeight:int):void
		{
			x = sWidth - hintBattleSkin.width;
			y = int(sHeight - hintBattleSkin.height - 100);
		}
		
		private function addMsg(msg:String):void
		{
			
			if(hintBattleSkin.scrollContainer.htmlText == "")
				hintBattleSkin.scrollContainer.htmlText = msg;
			else
				hintBattleSkin.scrollContainer.htmlText += msg+"<br/>";
			if(!isMouseIn)
			{
				showBar();
				mouseOut();
			}
			hintBattleSkin.scrollContainer.scrollToPosition(0,int.MAX_VALUE,0);//先用着，不然没法更新
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			switch(target){
				case hintBattleSkin.btnBig:
					isShowHint = true;
					break;
				
				case hintBattleSkin.btnSmall:
					isShowHint = false;
					break;
				
				case hintBattleSkin.zhanbao:
					AppManager.showApp(AppConstant.CROWN_ZHAN_BAO_PANEL);
					break;
			}
		}
		
		
		//------------------------------------

		private function get isShowHint():Boolean
		{
			return _isShowHint;
		}

		private function set isShowHint(value:Boolean):void
		{
			_isShowHint = value;
			
			hintBattleSkin.btnBig.visible = !_isShowHint;
			hintBattleSkin.btnSmall.visible = _isShowHint;
			hintBattleSkin.scrollContainer.visible = _isShowHint;
			hintBattleSkin.scrollContainer.alpha = _isShowHint?1:0.01;
			hintBattleSkin.bg.visible = _isShowHint;
			hintBattleSkin.bg.alpha = _isShowHint?1:0.01;
		}

		
	}
}