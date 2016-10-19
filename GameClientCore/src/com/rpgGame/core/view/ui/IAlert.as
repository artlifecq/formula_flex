package com.rpgGame.core.view.ui
{
	public interface IAlert
	{
		/**
		 * 弹出模式选择框
		 * @param alertStr			提示文本
		 * @param titleStr			标示皮肤路径
		 * @param okFunc			点击确定回调
		 * @param cancleFunc		点击取消回调
		 * @param isShowPrompt		是否显示提示框
		 * @param okLabel			左边按扭的上文本，默认：确定	
		 * @param cancleLabel		右边按扭的上文本，默认：取消	为空是则不显示这个按扭了
		 * @param promptLabel		提示框上文本，默认：本次登录不再提示	
		 * 
		 */		
		function showAlert( alertStr:String, titleStr:String, okFunc:Function, cancleFunc:Function, isShowPrompt:Boolean, okLabel:String = "确定", cancleLabel:String = "取消", promptLabel:String = "本次登录不再提示" ):void;
	}
}