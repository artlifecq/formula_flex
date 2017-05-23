package com.rpgGame.appModule.shop
{
	import com.rpgGame.appModule.LinkUtil;
	import com.rpgGame.core.ui.SkinUI;
	
	import org.mokylin.skin.app.zuoqi.huoquItemSkin;
	
	import away3d.events.Event;
	
	public class ItemGetAdviseItemExt extends SkinUI
	{
		private var _skin:huoquItemSkin;
		private var _menuStr:String;
		public function ItemGetAdviseItemExt()
		{
			_skin=new huoquItemSkin();
			super(_skin);
			
			this._skin.benfuqianwang.addEventListener(Event.TRIGGERED,onGo);
		}
		public function setData(lab:String,menu:String):void
		{
			this._skin.benfuzudui.text=lab;
			this._menuStr=menu;
		}
		private function onGo(eve:Event):void
		{
			// TODO Auto Generated method stub
			//MenuUtil.doMenu(_menuStr);
			LinkUtil.LinkDo(_menuStr);
		}
	}
}