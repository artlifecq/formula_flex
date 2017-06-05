package com.rpgGame.appModule.activety
{
	import com.rpgGame.app.ui.tab.ViewUI;
	
	import away3d.events.Event;
	
	import org.mokylin.skin.app.activety.zonghe.ActivetyAll_Skin;
	
	/**
	 *活动信息视图 
	 * @author dik
	 * 
	 */
	public class ActivetyInfoView extends ViewUI
	{
		private var _skin:ActivetyAll_Skin;
		public function ActivetyInfoView()
		{
			_skin=new ActivetyAll_Skin();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_skin.ListItem.itemRendererType=ActivetyItemRender;
		}
		
		override public function show(data:Object=null):void
		{
			_skin.ListItem.addEventListener(Event.CHANGE,onChange);
		}
		
		private function onChange(e:Event):void
		{
			
		}
		
		override public function hide():void
		{
			_skin.ListItem.removeEventListener(Event.CHANGE,onChange);
		}
	}
}