package com.rpgGame.appModule.guild.war
{
	import com.rpgGame.app.ui.tab.ViewUI;
	
	import org.mokylin.skin.app.banghui.wangcheng.WangCheng_Skin;
	
	import starling.display.DisplayObject;
	
	/**
	 *王城争霸战 
	 * @author dik
	 * 
	 */
	public class WczbWarViewUI extends ViewUI
	{
		private var _skin:WangCheng_Skin;
		public function WczbWarViewUI()
		{
			_skin=new WangCheng_Skin();
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