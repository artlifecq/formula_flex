package com.rpgGame.core.state.ai
{
	import com.game.engine3D.state.State;

	import flash.utils.getQualifiedClassName;

	/**
	 *
	 * AI状态基类
	 * @author L.L.M.Sunny
	 * 创建时间：2015-7-1 下午4:25:12
	 *
	 */
	public class AIState extends State
	{
		public function AIState(type : uint)
		{
			super(type);
		}

		override public function get tribe() : String
		{
			return getQualifiedClassName(AIState);
		}
	}
}
