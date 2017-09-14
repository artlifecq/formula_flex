package com.rpgGame.appModule.fulidating
{
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.sender.FuliDaTingSender;
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.coreData.cfg.StaticValue;
	
	import away3d.events.Event;
	
	import feathers.events.FeathersEventType;
	
	import org.mokylin.skin.app.fulidating.FLDT_Jihuomaduihuan;
	
	import starling.display.DisplayObject;
	
	public class JiHuoMaPanel extends ViewUI
	{
		private var _skin:FLDT_Jihuomaduihuan;
		private static const DEFAULT_CHAT_TEXT:String = "请输入兑换码";
		public function JiHuoMaPanel()
		{
			_skin=new FLDT_Jihuomaduihuan();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_skin.txtInput.maxChars=32;
			_skin.txtInput.y=_skin.txtInput.y+2;
		}
		
		override protected function onShow():void
		{
			super.onShow();
			_skin.txtInput.text = DEFAULT_CHAT_TEXT;
			_skin.txtInput.color=StaticValue.GRAY_TEXT;
			initEvent();
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target){
				case _skin.btnOk: 
					onBtnOkHandler();
					break;
			}			
		}
		
		private function initEvent():void
		{
			_skin.txtInput.addEventListener(FeathersEventType.FOCUS_IN,forceinHandler);
			_skin.txtInput.addEventListener(FeathersEventType.FOCUS_OUT,forceoutHandler);
		}
		
		private function closeEvent():void
		{
			_skin.txtInput.removeEventListener(Event.CHANGE,forceinHandler);
			_skin.txtInput.removeEventListener(FeathersEventType.FOCUS_OUT,forceoutHandler);
		}
		
		private function forceinHandler(evt:Event):void
		{
			_skin.txtInput.text="";		
			_skin.txtInput.color=StaticValue.BEIGE_TEXT;
		}
		
		private function forceoutHandler(evt:Event):void
		{
			if(_skin.txtInput.text == "")
			{
				_skin.txtInput.text = DEFAULT_CHAT_TEXT;
				_skin.txtInput.color=StaticValue.GRAY_TEXT;
			}
		}	
		
		protected function onBtnOkHandler():void
		{
			//发送领取兑换码的请求
			FuliDaTingSender.reqCardToServerMessage(_skin.txtInput.text);
			_skin.txtInput.text = DEFAULT_CHAT_TEXT;
			_skin.txtInput.color=StaticValue.GRAY_TEXT;
		}
	}
}