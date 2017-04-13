package com.rpgGame.app.utils
{
	import feathers.utils.filter.GrayFilter;
	
	import starling.display.DisplayObject;

	/**
	 *交互工具
	 *@author dik
	 *2017-4-11下午5:41:03
	 */
	public class TouchableUtil
	{
		public function TouchableUtil()
		{
		}
		
		/**
		 *灰掉ui 
		 * @param ui
		 * 
		 */
		public static function gray(ui:DisplayObject):void
		{
			if(!ui){
				return
			}
			GrayFilter.gray(ui);
			ui.touchable=false;
		}
		
		/**
		 *还原ui 
		 * @param ui
		 * 
		 */
		public static function ungray(ui:DisplayObject):void
		{
			if(!ui){
				return
			}
			GrayFilter.unGray(ui);
			ui.touchable=true;
		}
	}
}