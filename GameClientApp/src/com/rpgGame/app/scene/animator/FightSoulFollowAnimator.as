package com.rpgGame.app.scene.animator
{
	import com.game.engine3D.scene.render.vo.IRenderAnimator;
	import com.game.engine3D.utils.MathUtil;
	import com.game.engine3D.vo.BaseObj3D;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.coreData.enum.BoneNameEnum;
	import com.rpgGame.coreData.type.RenderUnitID;
	import com.rpgGame.coreData.type.RenderUnitType;
	
	import flash.geom.Vector3D;
	
	import gs.TweenLite;
	import gs.easing.Linear;
	
	/**
	 * 战魂的运动动画 
	 * @author NEIL
	 * 
	 */	
	public class FightSoulFollowAnimator implements IRenderAnimator 
	{
		
		private const DISTANCE:int = 50;
		private const DIS_HEIGHT:int = 30;
		
		private var _fightSoulRole:SceneRole;
		private var _owner:SceneRole;
		private var _delayTime:Number = 0;
		private static const TotalRunTime:Number = 5000;
		private static const RoundConst:Number = 100;
		
		public function FightSoulFollowAnimator(fightSoulRole:SceneRole)
		{
			_fightSoulRole = fightSoulRole;
		}
		
		public function setOwner(owner:BaseObj3D):void
		{
			_owner = owner as SceneRole;
		}
		
		private function down():void
		{
			TweenLite.to(_fightSoulRole, 1, {
				"y":_fightSoulRole.y + 100,
				"onComplete":up
			});
		}
		
		private function up():void
		{
			TweenLite.to(_fightSoulRole, 1, {
				"y":_fightSoulRole.y + 150,
				"onComplete":down
			});
		}
		
		public function dispose():void
		{
			TweenLite.killTweensOf(_fightSoulRole);
			SceneManager.getScene().removeSceneObj(_fightSoulRole);
			_fightSoulRole = null;
			_owner = null;
			_delayTime = 0;
		}
		
		public function update(gapTm:uint):void
		{
			var scenePos:Vector3D = _owner.getChildScenePositionByName(RenderUnitType.BODY, RenderUnitID.BODY, BoneNameEnum.c_0_name_01);
			if (scenePos)
			{
				/*_local3 = MathUtil.getDxByAngle(50, (_owner.rotationY + 180));
				_local3 = _local3 + _owner.x;
				_local4 = MathUtil.getDyByAngle(50, _owner.rotationY);
				_local4 = _local4 + _owner.z;
				if (Math.abs(_fightSoulRole.z - _local4) > 10 || Math.abs(_fightSoulRole.x - _local3) > 10 || Math.abs(_fightSoulRole.y + 30 - scenePos.y) > 10)
				{
					TweenLite.to(_fightSoulRole, 0.5, {
						"x":_local3,
						"y":(scenePos.y - 30),
						"z":_local4,
						"overwrite":1,
						"ease":Linear.easeNone
					});
				}*/
//				trace(scenePos.x,scenePos.y,scenePos.z);
				_delayTime +=gapTm;
				if(_delayTime>=TotalRunTime)
					_delayTime -=TotalRunTime;
				var percent:Number = Math.PI*2*_delayTime/TotalRunTime;
				_fightSoulRole.x = _owner.x+RoundConst*Math.sin(percent);
				_fightSoulRole.y +=180;
				_fightSoulRole.z = _owner.z+RoundConst*Math.cos(percent);
			}
		}	
	}
}