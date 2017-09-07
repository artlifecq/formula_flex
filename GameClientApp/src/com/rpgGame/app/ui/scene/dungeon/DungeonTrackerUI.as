package com.rpgGame.app.ui.scene.dungeon
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.app.manager.TrusteeshipManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.task.TaskAutoManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
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
		private var gTime : GameTimer;
		private var techTime:Number;
		public function DungeonTrackerUI(skin:StateSkin=null)
		{
			super(skin);
		}
		override protected function onShow() : void
		{
			super.onShow();
			if (gTime == null)gTime = new GameTimer("DungeonTrackerUI", 1000, 0, onTime);
			gTime.start();
			techTime=SystemTimeManager.curtTm;
		}
		override protected function onHide():void
		{
			super.onHide();
			if (gTime != null)gTime.stop();
			TrusteeshipManager.getInstance().findDist=0;
			TrusteeshipManager.getInstance().stopAll();
		}
		private function onTime() : void
		{
			if(MainRoleManager.actor.stateMachine.isIdle)
			{
				if((SystemTimeManager.curtTm-techTime)>=TaskAutoManager.AUTODUNGEON)
				{
					techTime=SystemTimeManager.curtTm;
					autoWalk();
				}
			}
			else
			{
				techTime=SystemTimeManager.curtTm;
			}
		}
		protected function autoWalk() : void
		{
			
		}
		
		
	}
}