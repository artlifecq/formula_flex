package com.editor.cfg
{

	/**
	 *
	 * 特效动画配置
	 * @author L.L.M.Sunny
	 * 创建时间：2015-12-03 下午2:30:12
	 *
	 */
	public class EffectAnimationConfig extends ConfigData
	{
		public function EffectAnimationConfig()
		{
			super();
			/**  资源路径 */
			this["res"] = "";
			/**  动画名称 */
			this["animatorName"] = "";
			/**  碰撞隐藏节点，用;分割多个节点 */
			this["collideHideNodes"] = "";
			/**  消散时间 */
			this["dissipateTime"] = 0;
			/**  前轴围绕半径 */
			this["frontAxleAroundRadius"] = 0;
			/**  前轴围绕角速度（度/秒） */
			this["frontAxleAroundAngularVelocity"] = 0;
			/**  收敛次数 */
			this["convergenceTimes"] = 0;
			/**  围绕半径 */
			this["aroundRadius"] = 0;
			/**  围绕角速度（度/秒） */
			this["aroundAngularVelocity"] = 0;
		}

		public function get mRes() : String
		{
			return this["res"];
		}

		public function set mRes(value : String) : void
		{
			this["res"] = value;
		}

		public function get mAnimatorName() : String
		{
			return this["animatorName"];
		}

		public function set mAnimatorName(value : String) : void
		{
			this["animatorName"] = value;
		}

		public function get mCollideHideNodes() : String
		{
			return this["collideHideNodes"];
		}

		public function set mCollideHideNodes(value : String) : void
		{
			this["collideHideNodes"] = value;
		}

		public function get mDissipateTime() : int
		{
			return this["dissipateTime"];
		}

		public function set mDissipateTime(value : int) : void
		{
			this["dissipateTime"] = value;
		}

		public function get mFrontAxleAroundRadius() : int
		{
			return this["frontAxleAroundRadius"];
		}

		public function set mFrontAxleAroundRadius(value : int) : void
		{
			this["frontAxleAroundRadius"] = value;
		}

		public function get mFrontAxleAroundAngularVelocity() : int
		{
			return this["frontAxleAroundAngularVelocity"];
		}

		public function set mFrontAxleAroundAngularVelocity(value : int) : void
		{
			this["frontAxleAroundAngularVelocity"] = value;
		}

		public function get mConvergenceTimes() : int
		{
			return this["convergenceTimes"];
		}

		public function set mConvergenceTimes(value : int) : void
		{
			this["convergenceTimes"] = value;
		}

		public function get mAroundRadius() : int
		{
			return this["aroundRadius"];
		}

		public function set mAroundRadius(value : int) : void
		{
			this["aroundRadius"] = value;
		}

		public function get mAroundAngularVelocity() : int
		{
			return this["aroundAngularVelocity"];
		}

		public function set mAroundAngularVelocity(value : int) : void
		{
			this["aroundAngularVelocity"] = value;
		}
	}
}
