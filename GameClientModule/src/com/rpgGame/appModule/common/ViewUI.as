package com.rpgGame.appModule.common
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
		
		public function show():void
		{
			
		}
		
		public function hide():void
		{
			
		}
		
		override protected function onHide() : void
		{
			hide();
		}
	}
}