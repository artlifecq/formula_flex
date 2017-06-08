package com.game.engine3D.state.role
{
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.vo.BaseRole;
	
	import flash.utils.getQualifiedClassName;
	
	/**
	 *
	 * 基础场景角色动作状态基类
	 * @author L.L.M.Sunny
	 * 创建时间：2015-4-9 下午5:25:12
	 *
	 */
	public class BaseActionState extends RoleState implements IActionState
	{
		private var _isFreeze : Boolean;
		/**
		 * 速率
		 */
		private var _speedRatio : Number;
		
		public function BaseActionState(type : uint)
		{
			_isFreeze = false;
			_speedRatio = 0;
			super(type);
		}
		
		override public function afterExecute() : void
		{
			super.afterExecute();
		}
		
		override public function pause() : void
		{
			super.pause();
		}
		
		override public function resume() : void
		{
			super.resume();
		}
		
		public function syncAnimation(isFreeze : Boolean = false, time : int = -1, speedRatio : Number = 1) : void
		{
			if (_machine && !_machine.isInPool)
			{
				_isFreeze = isFreeze;
				_speedRatio = speedRatio;
				if ((_machine.owner as BaseRole).usable)
				{
					(_machine.owner as BaseRole).forEachRenderUnit(eachPlayAnimation, [_isFreeze, time, _speedRatio]);
					if (_ref is RoleStateReference)
						(_ref as RoleStateReference).syncAnimat();
				}
			}
		}
		
		private function eachPlayAnimation(isFreeze : Boolean, time : int, speedRatio : Number, role : BaseRole, render : RenderUnit3D) : void
		{
			if (role && render)
				playAnimation(role, render, isFreeze, time, speedRatio);
		}
		
		public function playAnimation(role : BaseRole, render : RenderUnit3D, isFreeze : Boolean = false, time : int = -1, speedRatio : Number = 1) : void
		{
		}
		
		public function syncAnimationSpeed(speedRatio : Number) : void
		{
			if (_machine && !_machine.isInPool)
			{
				_speedRatio = speedRatio;
				if ((_machine.owner as BaseRole).usable)
				{
					(_machine.owner as BaseRole).forEachRenderUnit(eachSetAnimationSpeed, [_speedRatio]);
				}
			}
		}
		
		private function eachSetAnimationSpeed(speedRatio : Number, role : BaseRole, render : RenderUnit3D) : void
		{
			if (role && render)
				setAnimationSpeed(role, render, speedRatio);
		}
		
		public function setAnimationSpeed(role : BaseRole, render : RenderUnit3D, speedRatio : Number = 1) : void
		{
		}
		
		public function get isFreeze() : Boolean
		{
			return _isFreeze;
		}
		
		public function get speedRatio() : Number
		{
			return _speedRatio;
		}
		
		/**
		 * 互斥种群
		 * @return
		 *
		 */
		override public function get tribe() : String
		{
			return getQualifiedClassName(BaseActionState);
		}
		
		override public function dispose() : void
		{
			_isFreeze = false;
			_speedRatio = 0;
			super.dispose();
		}
	}
}
