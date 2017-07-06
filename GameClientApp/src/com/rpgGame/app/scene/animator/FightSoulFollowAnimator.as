package com.rpgGame.app.scene.animator
{
	import com.game.engine3D.config.GlobalConfig;
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
		private const DIS_HEIGHT:int = 30;
		
		private var _fightSoulRole:SceneRole;
		private var _owner:SceneRole;
		
		private const TotalRunTime:Number = 5000;
//		private static const RoundConst:Number = 150;
		
		private var _preTime:Number;
		
		private var _radius:int;

		public function get radius():int
		{
			return _radius;
		}

		public function set radius(value:int):void
		{
			_radius = value;
		}

		
		public function FightSoulFollowAnimator(fightSoulRole:SceneRole)
		{
			_fightSoulRole = fightSoulRole;
		}
		
		public function setOwner(owner:BaseObj3D):void
		{
			_owner = owner as SceneRole;
			_preTime = SystemTimeManager.curtTm;
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
		}
		
		private var _perTime:Number = 0;
	/*	public function update(gapTm:uint):void
		{
//			var curTime:Number = SystemTimeManager.curtTm;
//			if (curTime - _preTime < 100)
//			{
//				return;
//			}
//			_preTime = curTime;
			_perTime +=gapTm;
			if(_perTime >= TotalRunTime)
			{
				_perTime -= TotalRunTime;
			}
			var percent:Number = Math.PI * 2 * _perTime/TotalRunTime;
			
			_fightSoulRole.x = _owner.x + _radius*Math.sin(percent);
			_fightSoulRole.z = _owner.z + Math.cos(Math.abs(GlobalConfig.mapCameraRadian)) * _radius*Math.cos(percent);
			
//			var scenePos:Vector3D = _owner.getChildScenePositionByName(RenderUnitType.BODY, RenderUnitID.BODY, BoneNameEnum.c_0_head_01);
//			if (scenePos)
//			{
//				startX = MathUtil.getDxByAngle(DISTANCE, (_owner.rotationY + 180));
//				startX = startX + _owner.x;
//				startY = MathUtil.getDyByAngle(DISTANCE, _owner.rotationY);
//				startY = startY + _owner.z;
//				if (Math.abs(_fightSoulRole.z - startY) > 10 || Math.abs(_fightSoulRole.x - startX) > 10 || Math.abs(_fightSoulRole.y + 30 - scenePos.y) > 10)
//				{
//					TweenLite.to(_fightSoulRole, 0.5, {
//						"x":startX,
//						"y":(scenePos.y - DIS_HEIGHT),
//						"z":startY + 200,
//						"overwrite":1,
//						"ease":Linear.easeNone
//					});
//				}
//			}
		}	*/
		
		public function update(gapTm:uint):void
		{
			//当战魂攻击时，执行圆周运动
			var postTime:Number=0;
			if(_fightSoulRole.stateMachine.isAttacking)
			{
				postTime +=gapTm;
				if(postTime >= TotalRunTime)
				{
					postTime -= TotalRunTime;
				}
				var percent:Number = Math.PI * 2 * postTime/TotalRunTime;
				
				_fightSoulRole.x = _owner.x + _radius*Math.sin(percent);
				_fightSoulRole.z = _owner.z + Math.cos(Math.abs(GlobalConfig.mapCameraRadian)) * _radius*Math.cos(percent);
				return;
			}
			//当战魂待机状态时，只是跟随运动
			
			var curTime:Number = SystemTimeManager.curtTm;
			if ((curTime - _preTime) < 200)
			{
				return;
			}
			_preTime = curTime;
			
			var startX:Number = 0;
			var startY:Number = 0;
			var scenePos:Vector3D = _owner.getChildScenePositionByName(RenderUnitType.BODY, RenderUnitID.BODY, BoneNameEnum.c_0_head_01);
			if (scenePos)
			{
				startX = MathUtil.getDxByAngle(_radius, (_owner.rotationY + 180));
				startX = startX + _owner.x;
				startY = MathUtil.getDyByAngle(_radius, _owner.rotationY);
				startY = startY + _owner.z;
				if (Math.abs(_fightSoulRole.z - startY) > 10 || Math.abs(_fightSoulRole.x - startX) > 10 /*|| Math.abs(_fightSoulRole.y + 30 - scenePos.y) > 10*/)
				{
					TweenLite.to(_fightSoulRole, 0.5, {
						"x":startX,
//						"y":(scenePos.y - DIS_HEIGHT),
						"z":startY,
						"overwrite":1,
						"ease":Linear.easeNone
					});
				}
			}
		}
	}
}