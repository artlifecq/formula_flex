package com.rpgGame.app.state.role.control
{
	import com.game.engine3D.state.role.RoleStateReference;
	import com.rpgGame.coreData.info.buff.BuffData;

	/**
	 *
	 * buff状态引用
	 * @author L.L.M.Sunny
	 * 创建时间：2015-10-30 下午2:25:12
	 *
	 */
	public class BuffStateReference extends RoleStateReference
	{
		private var _buffData:BuffData;
//		private var _disappearTime : Number;

		public function BuffStateReference()
		{
			super();
		}

		public function setParams(buffData : BuffData) : void
		{
			_buffData = buffData;
//			_disappearTime = disappearTime;
		}

		public function get buffData() : BuffData
		{
//			return _disappearTime;
			return _buffData;
		}

		override public function dispose() : void
		{
			_buffData = null;
//			_disappearTime = 0;
			super.dispose();
		}
	}
}
