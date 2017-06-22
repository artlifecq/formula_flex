package com.rpgGame.appModule.guild.war
{
	import feathers.controls.StateSkin;
	import feathers.controls.renderers.DefaultListItemRenderer;
	
	/**
	 *王城争霸战战报信息渲染器  
	 * @author dik
	 * 
	 */
	public class WczbWarHistoryItemRender extends DefaultListItemRenderer
	{
		private var _skin:StateSkin;
		public function WczbWarHistoryItemRender()
		{
			super();
		}
		
		override protected function initialize():void
		{
			
		}
		
		override public function get height():Number
		{
			if(_skin){
				return _skin.height;
			}
			return 0;
		}
	}
}