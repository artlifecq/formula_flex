package com.rpgGame.app.scene.animator
{
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.scene.render.vo.RenderParamData;
	import com.game.engine3D.utils.MathUtil;
	import com.game.engine3D.vo.BaseObj3D;
	import com.rpgGame.app.fight.spell.ReleaseSpellInfo;
	import com.rpgGame.app.scene.SceneRole;
	
	import flash.geom.Vector3D;
	
	/**
	 *
	 * 特效前轴双围绕动画
	 * @author L.L.M.Sunny
	 * 创建时间：2015-12-15 上午11:12:28
	 *
	 */
	public class FrontAxleDoubleAroundAnimator extends CommonTrajectoryAnimator
	{
		public static const name : String = "FrontAxleDoubleAroundAnimator";
		/**
		 *  前轴围绕半径
		 */		
		private var _frontAxleAroundRadius : int;
		/**
		 *  前轴围绕角速度（度/秒） 
		 */		
		private var _frontAxleAroundAngularVelocity : Number;
		/**
		 *  收敛次数
		 */		
		private var _convergenceTimes : int;
		private var _subEffectRu : RenderUnit3D;
		private var _currAroundFlip : int;
		private var _currAroundFlipSpeed : Number;
		private var _currAroundRadius : Number;
		private var _totalAngle : int;
		
		public function FrontAxleDoubleAroundAnimator(spellInfo : ReleaseSpellInfo, targetPos : Vector3D, targetRole : SceneRole, totalTime : int, speed : int, isTrackTarget : Boolean,
													  matchTerrain : Boolean, isFlyCross : Boolean, isAdaptiveTargetHeight : Boolean, 
													  moveDelay : int, playDelay : int, releaseDelayTime : int, throwHeight : int, throwWeightRatio : int, 
													  frontAxleAroundRadius : int, frontAxleAroundAngularVelocity : Number, convergenceTimes : int)
		{
			super(spellInfo, targetPos, targetRole, totalTime, speed, isTrackTarget, matchTerrain, isFlyCross, isAdaptiveTargetHeight, moveDelay, playDelay, releaseDelayTime, 
				throwHeight, throwWeightRatio);
			_frontAxleAroundRadius = frontAxleAroundRadius;
			_frontAxleAroundAngularVelocity = frontAxleAroundAngularVelocity;
			_convergenceTimes = convergenceTimes;
		}
		
		override public function setOwner(owner : BaseObj3D) : void
		{
			super.setOwner(owner);
		}
		
		override protected function onStartMove() : void
		{
			super.onStartMove();
			var rud : RenderParamData = new RenderParamData(1, "FrontAxleDoubleAroundAnimator", _renderUnit.renderParamData.sourcePath, _renderUnit.renderParamData.sourceName);
			_subEffectRu = _renderSet.addRenderUnit(rud);
			_subEffectRu.repeat = 0;
			
			_currAroundRadius = _frontAxleAroundRadius;
			_totalAngle = _collideTime * _frontAxleAroundAngularVelocity * 0.001;
			_currAroundFlip = 1;
			_currAroundFlipSpeed = _frontAxleAroundRadius / _collideTime * (_convergenceTimes > 1 ? _convergenceTimes + 1 : _convergenceTimes);
		}
		
		override protected function startPlay() : void
		{
			super.startPlay();
			if (_subEffectRu)
			{
				_subEffectRu.play(0);
			}
		}
		
		override protected function setRenderChildVisible(childName : String) : void
		{
			super.setRenderChildVisible(childName);
			if (_subEffectRu)
			{
				_subEffectRu.setVisibleByName([childName], false);
			}
		}
		
		override protected function onUpdateAnimation() : void
		{
			super.onUpdateAnimation();
			
			var angle : Number = _collidePerTime * _totalAngle;
			_currAroundRadius += _currAroundFlip * _diffTime * _currAroundFlipSpeed;
			if (_currAroundRadius > _frontAxleAroundRadius)
			{
				_currAroundRadius = _frontAxleAroundRadius - (_currAroundRadius % _frontAxleAroundRadius);
				_currAroundFlip = -1;
			}
			else if (_currAroundRadius < -_frontAxleAroundRadius)
			{
				_currAroundRadius = -_frontAxleAroundRadius + (-_currAroundRadius % _frontAxleAroundRadius);
				_currAroundFlip = 1;
			}
			
			var aroundRadius : int = _currAroundRadius;
			
			angle = angle + 90;
			var frontAxleAroundDx : Number = MathUtil.getDxByAngle(aroundRadius, angle);
			var frontAxleAroundDy : Number = MathUtil.getDyByAngle(aroundRadius, angle);
			if (_renderUnit)
			{
				_renderUnit.x = frontAxleAroundDx;
				_renderUnit.y = frontAxleAroundDy;
				_renderUnit.z = 0;
			}
			
			angle = angle + 180;
			frontAxleAroundDx = MathUtil.getDxByAngle(aroundRadius, angle);
			frontAxleAroundDy = MathUtil.getDyByAngle(aroundRadius, angle);
			if (_subEffectRu)
			{
				_subEffectRu.x = frontAxleAroundDx;
				_subEffectRu.y = frontAxleAroundDy;
				_subEffectRu.z = 0;
			}
		}
		
		override public function dispose() : void
		{
			_subEffectRu = null;
			super.dispose();
		}
	}
}
