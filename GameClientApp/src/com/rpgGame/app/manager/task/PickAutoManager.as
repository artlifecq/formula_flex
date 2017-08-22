package com.rpgGame.app.manager.task
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.app.manager.TrusteeshipFightSoulManager;
	import com.rpgGame.app.manager.ctrl.ControlAutoFightSelectSkill;
	import com.rpgGame.app.manager.ctrl.ControlAutoPick;
	import com.rpgGame.app.manager.ctrl.ControlMainPlayerFight;
	import com.rpgGame.app.manager.ctrl.ControlTripleSkill;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.state.ai.AIStateMachine;
	import com.rpgGame.coreData.role.HeroData;

	/**
	 * 物品自动拾取控制
	 * @author YT
	 * 创建时间：2017-8-21 下午1:33:18
	 */
	public class PickAutoManager
	{
		private static var _instance : PickAutoManager;
		public static function getInstance() : PickAutoManager
		{
			if (!_instance)
			{
				_instance = new PickAutoManager();
			}
			return _instance;
		}
		
		
		private var _gTimer : GameTimer;
		private var _isPickRunning : Boolean=false;
		private var _autoPickCtrl:ControlAutoPick;
		public function PickAutoManager()
		{
			_gTimer = new GameTimer("PickAutoManager", 500, 0, onUpdate);
			_isPickRunning = false;
		}
		public function setup(role : SceneRole) : void
		{
			_autoPickCtrl=new ControlAutoPick(role);			
		}
		public function startPickAuto() : void
		{
			if(!_isPickRunning)
			{
				_gTimer.start();
				_isPickRunning = true;
				onUpdate();
			}
		}
		
		public function stopPickAuto() : void
		{
			if (!_isPickRunning)
				return;
			stop();
		}
		private function stop() : void
		{
			_isPickRunning = false;
			_gTimer.reset();
			_gTimer.stop();
		}
		
		private function onUpdate() : void
		{
			if (!_isPickRunning)
				return;
			if (_autoPickCtrl.isPicking||autoPickCtrl.TryAutoPickItem()) 
			{
				//stopFightTarget();
				return;
			}
			if (_autoPickCtrl.isArrivePk) 
			{
				return;
			}
			
		}
		
		
		
		
		
		public  function get autoPickCtrl():ControlAutoPick
		{
			return _autoPickCtrl;
		}
	}
}