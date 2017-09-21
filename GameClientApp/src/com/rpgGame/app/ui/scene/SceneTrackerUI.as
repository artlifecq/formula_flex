package com.rpgGame.app.ui.scene
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.app.manager.TrusteeshipManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.task.TaskAutoManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.core.ui.SkinUI;
	
	import feathers.controls.StateSkin;
	
	import gs.TweenMax;
	
	import org.game.netCore.data.long;
	
	import starling.display.DisplayObject;
	
	/**
	 *场景追踪ui基础类
	 *@author dik
	 *2017-5-9下午10:07:59
	 */
	public class SceneTrackerUI extends SkinUI
	{
		private var tween:TweenMax;
		
		private var gTime : GameTimer;
		private var techTime:Number;
		/**
		 *进入场景时的唯一id
		 */
		protected var sceneId:long;
		
		public function SceneTrackerUI(skin:StateSkin=null)
		{
			super(skin);
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target.name){
				case "btn_close":
					setBoxState(false);
					break;
				case "btn_open":
					setBoxState(true);
					break;
			}
		}
		
		override protected function onShow() : void
		{
			super.onShow();
			sceneId=MainRoleManager.actorInfo.verityMapId;
			
		}
		
		override protected function onHide() : void
		{
			super.onHide();
			sceneId=null;
			stopAutoWalk();
			TrusteeshipManager.getInstance().findDist=0;
			TrusteeshipManager.getInstance().stopAll();
		}
		
		override protected function onStageResize(sw : int, sh : int) : void
		{
			this.x = sw - this._stateSkin.width;
			this.y = 273;
		}
		
		private function setBoxState(state:Boolean):void
		{
			if(tween){
				tween.kill();
			}
			if(state){
				tween=TweenMax.to(_stateSkin["task_box"],0.5,{x:0});
			}else{
				tween=TweenMax.to(_stateSkin["task_box"],0.5,{x:_stateSkin["task_box"].width});
			}
			_stateSkin["btn_close"].visible = state;
			_stateSkin["btn_open"].visible = !state;
		}
		
		public function startAutoWalk():void
		{
			if (gTime == null)gTime = new GameTimer("DungeonTrackerUI", 1000, 0, onTime);
			gTime.start();
			techTime=SystemTimeManager.curtTm;
		}
		public function stopAutoWalk():void
		{
			if (gTime != null)gTime.stop();
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

