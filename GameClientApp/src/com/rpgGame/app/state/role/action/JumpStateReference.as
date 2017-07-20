package com.rpgGame.app.state.role.action
{
	import com.game.engine3D.state.role.RoleStateReference;
	
	import flash.geom.Point;
	import flash.geom.Vector3D;

	/**
	 *
	 * 跳跃状态引用
	 * @author L.L.M.Sunny
	 * 创建时间：2015-4-10 上午10:15:16
	 *
	 */
	public class JumpStateReference extends RoleStateReference
	{
		private var _jumpAction : int = 0;
		private var _jumpTime : int = 0;
		private var _destPoint:Vector3D;//跳跃目的地
		public function JumpStateReference()
		{
			super();
		}

		public function setParams(jumpAction:int,costTime:int=0,destPoint:Vector3D=null) : void
		{
			_jumpAction = jumpAction;
			_jumpTime=costTime;
			_destPoint=destPoint;
		}

		public function set jumpAction(value : int) : void
		{
			_jumpAction = value;
		}
		public function get destPoint():Vector3D
		{
			return _destPoint;
		}
		
		public function set destPoint(value:Vector3D):void
		{
			_destPoint = value;
		}
		/**
		 * 跳跃的几段跳，一般都有2段跳 
		 * @return 
		 * 
		 */		
		public function get jumpAction() : int
		{
			return _jumpAction;
		}

		override public function dispose() : void
		{
			_jumpAction = 0;
			super.dispose();
		}

		public function get jumpTime():int
		{
			return _jumpTime;
		}

		public function set jumpTime(value:int):void
		{
			_jumpTime = value;
		}

		

	}
}
