package com.rpgGame.app.ui.tab
{
	import com.rpgGame.core.ui.SkinUI;
	
	import feathers.controls.StateSkin;
	
	/**
	 *ui视图
	 *@author dik
	 *2017-4-11上午11:37:58
	 */
	public class ViewUI extends SkinUI
	{
		public function ViewUI(skin:StateSkin=null)
		{
			super(skin);
		}
		
		public function show(data:Object=null):void
		{
			
		}
		
		/**
		 *隐藏视图避免与uiskinpanl的hide混淆 
		 * 
		 */
		public function hideView():void
		{
			
		}
		
		override protected function onHide() : void
		{
			hideView();
		}
	}
}