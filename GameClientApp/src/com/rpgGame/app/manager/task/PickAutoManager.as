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
		private var _onArrive:Function;
		private var _onArriveData:Object;
		public function PickAutoManager()
		{
			_gTimer = new GameTimer("PickAutoManager", 500, 0, onUpdate);
			_isPickRunning = false;
		}
		public function setup(role : SceneRole) : void
		{
			_autoPickCtrl=new ControlAutoPick(role);			
		}
		public function startPickAuto(onArrive:Function=null,data:Object = null,fore:Boolean=false) : void
		{
			if(!_isPickRunning||fore)
			{
				_onArrive=onArrive;
				_onArriveData=data;
			}
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
			autoPickCtrl.TryAutoPickItem();
			if(!hasPickItem())
			{
				pickOnArrive();
			}
			/*if (_autoPickCtrl.isPicking||autoPickCtrl.TryAutoPickItem()) 
			{
				//stopFightTarget();
				return;
			}
			if (_autoPickCtrl.isArrivePk) 
			{
				return;
			}*/
			
			
			
		}
		/**检测掉落物并开始捡，用于自动战斗中*/
		public function techPickItem():Boolean
		{
			if(hasPickItem()&&!isPickRunning)
			{
				startPickAuto();
			}
			
			return isPickRunning;
		}
		
		private function pickOnArrive():void
		{Lyt.a("拾取完成");
			stopPickAuto();
			if(_onArrive!=null)
			{
				if(_onArriveData!=null)
				{
					_onArrive(_onArriveData);
				}
				else
				{
					_onArrive();
				}
			}
		}
		
		
		public function hasPickItem():Boolean
		{
			return autoPickCtrl.hasSth2Pick();
		}
		
		
		
		public  function get autoPickCtrl():ControlAutoPick
		{
			return _autoPickCtrl;
		}

		public function get isPickRunning():Boolean
		{
			return _isPickRunning;
		}

		public function set isPickRunning(value:Boolean):void
		{
			_isPickRunning = value;
		}

	}
}