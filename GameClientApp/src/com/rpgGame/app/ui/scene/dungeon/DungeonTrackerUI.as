package com.rpgGame.app.ui.scene.dungeon
{
	import com.rpgGame.app.ui.scene.SceneTrackerUI;
	
	import feathers.controls.StateSkin;
	
	import gs.TweenMax;
	
	/**
	 *副本追踪ui基础类
	 *@author dik
	 *2017-5-9下午10:07:59
	 */
	public class DungeonTrackerUI extends SceneTrackerUI
	{
		private var tween:TweenMax;
		
		public function DungeonTrackerUI(skin:StateSkin=null)
		{
			super(skin);
		}
		override protected function onShow() : void
		{
			super.onShow();
			
		}
		override protected function onHide():void
		{
			super.onHide();
		}
		
	}
}