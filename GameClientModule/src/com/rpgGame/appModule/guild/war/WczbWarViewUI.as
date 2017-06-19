package com.rpgGame.appModule.guild.war
{
	import com.rpgGame.app.ui.tab.ViewUI;
	
	import feathers.controls.StateSkin;
	
	import starling.display.DisplayObject;
	
	/**
	 *王城争霸战 
	 * @author dik
	 * 
	 */
	public class WczbWarViewUI extends ViewUI
	{
		private var _skin:StateSkin;
		public function WczbWarViewUI(skin:StateSkin=null)
		{
			_skin=new StateSkin();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			
		}
		
		override public function show(data:Object=null):void
		{
			super.show(data);
		}
		
		override public function hide():void
		{
			
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target)
			{
				case _skin.container:
					break;
			}
		}
	}
}