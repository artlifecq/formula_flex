package com.rpgGame.app.state.role.action
{

	/**
	 *
	 * 跑步状态引用
	 * @author L.L.M.Sunny
	 * 创建时间：2015-4-10 上午10:15:16
	 *
	 */
	public class RunStateReference extends WalkStateReference
	{
		/**
		 *
		 * @param speed 单位移动速度
		 * @param baseSpeed 基准移动速度
		 *
		 */
		public function RunStateReference()
		{
			super();
		}

		override public function setParams(speed : Number = 0, baseSpeed : Number = 0) : void
		{
			super.setParams(speed, baseSpeed);
		}
	}
}
