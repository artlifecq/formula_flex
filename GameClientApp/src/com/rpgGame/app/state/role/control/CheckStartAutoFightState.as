package com.rpgGame.app.state.role.control
{
	import com.game.engine3D.manager.SceneMapDataManager;
	import com.game.engine3D.state.IState;
	import com.rpgGame.app.manager.TrusteeshipManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.core.state.role.control.ControlState;
	import com.rpgGame.coreData.clientConfig.Q_map;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.info.map.EnumMapType;
	import com.rpgGame.coreData.info.map.SceneData;
	import com.rpgGame.coreData.type.RoleStateType;
	
	import flash.utils.clearTimeout;
	import flash.utils.getQualifiedClassName;
	import flash.utils.setTimeout;
	
	public class CheckStartAutoFightState extends ControlState
	{
		private static const IDLE_TIME:int=10*1000;
		private var _timeId:int;
		public function CheckStartAutoFightState()
		{
			super(RoleStateType.CONTROL_CHECK_AUTO_FIGHT);
		}
		override public function execute():void
		{
			super.execute();
			if (_timeId!=0) 
			{
				clearTimeout(_timeId);
				
			}
			_timeId=setTimeout(autoStart,IDLE_TIME);
		}
		
		private function autoStart():void
		{
			// TODO Auto Generated method stub
			_timeId=0;
			var mapId:int=MainRoleManager.actorInfo.mapID;
			var sceneData:SceneData=MapDataManager.getMapInfo(mapId);
			if (EnumMapType.MAP_TYPE_TOWERS==sceneData.mapType) 
			{
				TrusteeshipManager.getInstance().startAutoFight();
			}
			
		}
		override public function enterPass(prevState:IState, force:Boolean=false):Boolean
		{
			if ((_machine.owner as SceneRole).isMainChar)
			{
				var role:SceneRole=_machine.owner as SceneRole;
				var scene:SceneData=MapDataManager.currentScene;
				if (!scene) 
				{
					return false;
				}
				var map:Q_map=MapDataManager.currentScene.getData();
				if (map&&EnumMapType.MAP_TYPE_TOWERS==map.q_map_type) 
				{
					if (!TrusteeshipManager.getInstance().isAuto) 
					{
						return true;
					}
				}
			}
			return false;
		}
		override public function leave():void
		{
			super.leave();
			if ((_machine.owner as SceneRole).isMainChar)
			{
				if (_timeId!=0) 
				{
					clearTimeout(_timeId);
					_timeId=0;
				}
			}
		}
		override public function get tribe():String
		{
			return getQualifiedClassName(CheckStartAutoFightState);
		}
	}
}