package com.rpgGame.app.ui.alert
{
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.UIUtil;
	
	import starling.display.DisplayObject;
	
	/**
	 * 游戏弹窗提示-输入 
	 * @author wewell
	 */	
	public class AlertInput extends SkinUI
	{
		private static var _ins:AlertInput;;
		
		public var skin:Object;//AlertInputSkin;
		private var okFCallBack:Function;
		private var closeCallBack:Function;
		
		public function AlertInput()
		{
			//skin = new AlertInputSkin(); 
			super(skin);
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			switch(target){
				case skin.btnOk:
					if(okFCallBack != null)okFCallBack(inputTxt);
					hide();
					break;
				case skin.btnCancel:
					if(closeCallBack != null)closeCallBack();
					hide();
					break;
			}
		}
		
		
		public function get inputTxt():String
		{
			return skin.txtInput.text;
		}
		
		public static function show(msg:String,  onOk:Function=null,close:Function=null):AlertInput
		{
			if(!_ins)_ins = new AlertInput;
			_ins.skin.labTile.text = msg;
			_ins.okFCallBack = onOk;
			_ins.closeCallBack = close;
			UIUtil.showToCenter(_ins);
			return _ins;
		}
		
		public static function hide():void
		{
			if(_ins)_ins.removeFromParent();
		}
	}
}


