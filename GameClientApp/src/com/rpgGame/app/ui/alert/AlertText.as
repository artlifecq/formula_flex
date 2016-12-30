package com.rpgGame.app.ui.alert
{
	import com.gameClient.utils.StringFilter;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.ui.UIModel;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.coreData.lang.LangCrown;
	
	import org.mokylin.skin.app.alert.AlertTextSkin;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.events.Event;

	/**
	 * 可以输入的alert 
	 * 2016年2月22日15:29:24 添加输入检测功能
	 * @author mandragora
	 * 
	 */	
	public class AlertText extends SkinUIPanel
	{
		public var skin : Object;//AlertTextSkin;
		public var closeFun : Function;//抛出text
		public var okFun : Function;//抛出text
		public function AlertText()
		{
			//skin =new AlertTextSkin();
			skin.text.addEventListener(Event.CHANGE,onTextChange);
			super(skin);
			model = true;
		}
		
		private function onTextChange(e:Event):void
		{
			if(StringFilter.checkBadWords(skin.text.text))
				NoticeManager.showNotify("内容存在非法字符，请重新编辑。");
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			switch(target)
			{
				case skin.closeBtn:
				case skin.cancel:
					closeFun && closeFun(skin.text.text);
					hideAlert();
					break;
				case skin.btn:
					if(StringFilter.checkBadWords(skin.text.text))
					{
						NoticeManager.showNotify("内容存在非法字符，请重新编辑。");
						return;
					}
					if (skin.text.text.length > skin.text.maxChars)
					{
						//限制不能输入超过五十个字
						NoticeManager.showNotify(LangCrown.CROWN_MAX_INPUT_TEXT, skin.text.maxChars);
						return;
					}
					okFun && okFun(skin.text.text);
					hideAlert();
					break;
			}
		}
		
		override　public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,StarlingLayerManager.hintUILayer);
		}
		
		private static var _ins : AlertText;
		
		public static function showAlert(title : String,msg:String,onOkFun:Function=null,onCloseFun:Function=null):void
		{
			if(!_ins)_ins = new AlertText();
			_ins.skin.title.text = title;
			_ins.skin.text.text = msg;
			_ins.skin.text.selectRange(0,msg.length - 1);
			_ins.closeFun = onCloseFun;
			_ins.okFun = onOkFun;
			_ins.skin.text.selectRange(0,_ins.skin.text.text.length);
			_ins.show();
			UIModel.instence.showModel(_ins);
		}
		
		public static function hideAlert():void
		{
			UIModel.instence.hideModel(_ins);
			if(_ins)_ins.hide();
		}
	}
}