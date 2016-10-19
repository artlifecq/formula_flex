package com.rpgGame.app.state.role.action
{
	import com.game.engine3D.state.role.RoleStateReference;

	/**
	 *
	 * 行走状态引用
	 * @author L.L.M.Sunny
	 * 创建时间：2015-4-10 上午10:15:16
	 *
	 */
	public class WalkStateReference extends RoleStateReference
	{
		private var _footSpan : Number = 0;

		/**
		 *
		 * @param speed 单位移动速度
		 * @param baseSpeed 基准移动速度
		 *
		 */
		public function WalkStateReference()
		{
			super();
		}

		public function setParams(speed : Number = 0, baseSpeed : Number = 0) : void
		{
			_footSpan = (speed > 0 && baseSpeed > 0) ? (speed / baseSpeed) : 1;
		}

		/**
		 * 动画脚步跨度，单位移动速度与基准移动速度的比值(动画脚步部跨度=单位移动速度/基准移动速度)，为0则不使用动态调整。 @L.L.M.Sunny 20150409
		 * 身体换装的播放速率=身体换装的播放速度/动画脚步跨度。
		 */
		public function get footSpan() : Number
		{
			return _footSpan;
		}

		override public function dispose() : void
		{
			_footSpan = 0;
			super.dispose();
		}
	}
}
