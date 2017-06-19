package com.rpgGame.appModule.guild.war
{
	import feathers.controls.StateSkin;
	import feathers.controls.renderers.DefaultListItemRenderer;
	
	/**
	 *王城争霸战申请列表渲染器 
	 * @author dik
	 * 
	 */
	public class WczbWarApplyItemRender extends DefaultListItemRenderer
	{
		private var _skin:StateSkin;
		public function WczbWarApplyItemRender()
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