package com.rpgGame.coreData.info.npc
{

	/**
	 *
	 * npc传送信息
	 * @author fly.liuyang
	 * 创建时间：2014-5-9 下午5:01:08
	 *
	 */
	public class NpcTransInfo
	{
		/** 传送到的国家 */
		public var country : int;
		/** 传送话费多少 */
		public var cost : int;
		public var npcId : int;
		public var itemIndex : int;
		/** 传送到的场景id */
		public var scene : int;


		public function NpcTransInfo()
		{
		}
	}
}
