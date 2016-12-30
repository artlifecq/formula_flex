package com.rpgGame.app.manager
{
	import com.rpgGame.app.sender.GmSender;
	import com.rpgGame.core.events.GMEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.ui.SkinUI;
	
	import flash.ui.Keyboard;
	
	import feathers.controls.Label;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.common.ConsolePanelSkin;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.events.KeyboardEvent;

	/**
	 * GM控制台 /help
	 * @author wewell@163.com
	 * 
	 */	
	public class ConsoleApplication extends SkinUI
	{
		private var skin:Object;//ConsolePanelSkin;
		/** 最大历史记录条数 **/
		private const MAX_HISTORY:int = 5;
		/** cmd历史记录数据 **/
		private var cmdHistory:Array;
		
//		private static var _ins:ConsoleApplication;
//		public static function show():void
//		{
//			if(_ins == null)
//			{
//				_ins = new ConsoleApplication();
//			}
//			_ins.x = 0;
//			_ins.y = int ( (Starling.current.stage.stageHeight - _ins.height)/2 );
//			Starling.current.stage.addChild(_ins);
//		}
		
		public function ConsoleApplication()
		{
			//skin = new ConsolePanelSkin;
			super(skin);
			skin.txtArea.isEditable = false;
			skin.txtArea.scrollBarDisplayMode = "none";
			skin.txtArea.snapToPages = true;
			skin.grpHistory.backgroundSkin = skin.grpBg;
			TipTargetManager.show( skin.imgTips, TargetTipsMaker.makeSimpleTextTips("help：获取相关GM指令帮助！<br/>cls：清空文本指令！") );
		}
		
		/**
		 *当面板显示时,给子类处理自身逻辑
		 */	
		override protected function onShow():void
		{
			onCmdIn("cls");
			onCmdIn("help");
			skin.txtInput.text = "";
			
			//这个设置会导致文本内容不显示的，暂时不要了
//			UIStateSetHelper.setTextAreaFormat(skin.txtArea, TextFormatPool.getTextFormat(0x00FF00,12,false,false,5));
			
			EventManager.addEvent(GMEvent.GM_INFO_RET, addMsg);
			Starling.current.stage.addEventListener(starling.events.KeyboardEvent.KEY_UP, stage_keyUpHandler);
		}
		
		/**
		 *当面板隐藏时,给子类处理自身逻辑
		 */
		override protected function onHide():void
		{
			EventManager.removeEvent(GMEvent.GM_INFO_RET, addMsg);
			Starling.current.stage.removeEventListener(starling.events.KeyboardEvent.KEY_UP, stage_keyUpHandler);
		}
		
		/**
		 * @private
		 */
		protected function stage_keyUpHandler(event:starling.events.KeyboardEvent):void
		{
			if(event.keyCode == Keyboard.ENTER)
			{
				onCmdIn(skin.txtInput.text);
			}
			else if(event.keyCode == Keyboard.UP || event.keyCode == Keyboard.DOWN)
			{
				showHistory()
			}
		}
		
		/**
		 * GM信息更新
		 * @param str
		 * 
		 */		
		public function addMsg(str:String):void
		{
			skin.txtArea.text += "\n"+str;
			skin.txtArea.scrollToPosition(0,skin.txtArea.maxVerticalScrollPosition, 0.5);
		}
		
		/**
		 *  
		 * @param str
		 * 
		 */		
		public function onCmdIn(str:String):void
		{
			addMsg(str);
			
			switch(str)
			{
				case "cls":
					skin.txtArea.htmlText = "";
					break;
				case "exit":
//					hide();
					break;
				default:
					commitCmd(str);
					break;
			}
			
			hideHistory();
			skin.txtInput.text = "";
			addToHistroy(str);
		}
		
		/**
		 * 发送一条cmd指令 
		 * @param str
		 * 
		 */		
		private function commitCmd(str:String):void
		{
			GmSender.sendMsg(str);
		}
		
		/**
		 * 添加一条输入记录 
		 * @param str
		 * 
		 */		
		private function addToHistroy(str:String):void
		{
			if(cmdHistory == null)
			{
				cmdHistory = [];
			}
			if(cmdHistory.indexOf(str) != -1)return;
			
			if(cmdHistory.length > MAX_HISTORY)
			{
				cmdHistory.shift();
			}
			cmdHistory.push(str);
		}
		
		/**
		 * 更新历史输入内容 
		 * 
		 */		
		private function updateHistory():void
		{
			var num:int = skin.grpHistory.numChildren;
			num = Math.min(num, MAX_HISTORY);
			for (var i:int=0; i<num; i++)
			{
				var label:Label = skin.grpHistory.getChildAt(i) as Label;
				label.text = i < cmdHistory.length ? cmdHistory[i] : "";
			}
		}
		
		/**
		 * 显示历史输入内容
		 * 
		 */		
		private function showHistory():void
		{
			skin.grpHistory.visible = true;
			updateHistory();
		}
		
		/**
		 * 隐藏历史输入内容 
		 * 
		 */		
		private function hideHistory():void
		{
			skin.grpHistory.visible =false;
		}
		
		/**
		 *当子对象被点击时,子类覆盖此方法以实现特定目标被点击后的处理
		 */		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			if(target.name && target.name.indexOf("lb") == 0)
			{
				onCmdIn(Label(target).text);
				return;
			}
			switch(target)
			{
//				case skin.btnClose:
//					hide();
//					break;
				default:
					hideHistory();
					break;
			}
		}
	}
}
