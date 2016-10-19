package com.rpgGame.core.state.ai
{
	import com.rpgGame.coreData.type.AIStateType;

	/**
	 *
	 * 空AI
	 * @author L.L.M.Sunny
	 * 创建时间：2015-7-1 下午4:25:12
	 *
	 */
	public class AINone extends AIState
	{
		public function AINone()
		{
			super(AIStateType.AI_NONE);
		}
	}
}
