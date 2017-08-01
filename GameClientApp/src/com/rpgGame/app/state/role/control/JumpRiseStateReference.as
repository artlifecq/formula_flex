package com.rpgGame.app.state.role.control
{
	import com.game.engine3D.state.role.RoleStateReference;
	
	import flash.geom.Vector3D;

	/**
	 *
	 * 跳跃上升状态引用
	 * @author L.L.M.Sunny
	 * 创建时间：2016-01-01 上午11:15:12
	 *
	 */
	public class JumpRiseStateReference extends RoleStateReference
	{
			
		private var _totalTime : int;
			
		private var _isSecondJump : Boolean;
		
		private var _destPoint:Vector3D;
		private var _isEnd:Boolean;
		public function JumpRiseStateReference()
		{
			super();
		}

		public function setParams(totalTime : int, isSecondJump : Boolean,destPoint:Vector3D=null,isEnd:Boolean=false) : void
		{
			_totalTime = totalTime;
			_isSecondJump = isSecondJump;
			_destPoint=destPoint;
			_isEnd=isEnd;
		}

		/**
		 * 上升过程中总时间 
		 */	
		public function get totalTime() : int
		{
			return _totalTime;
		}

		/**
		 * 是否是2级跳 
		 */	
		public function get isSecondJump() : Boolean
		{
			return _isSecondJump;
		}

		override public function dispose() : void
		{
			_totalTime = 0;
			_isSecondJump = false;
			super.dispose();
		}

		public function get destPoint():Vector3D
		{
			return _destPoint;
		}

		public function set destPoint(value:Vector3D):void
		{
			_destPoint = value;
		}

		public function get isEnd():Boolean
		{
			return _isEnd;
		}

	}
}
