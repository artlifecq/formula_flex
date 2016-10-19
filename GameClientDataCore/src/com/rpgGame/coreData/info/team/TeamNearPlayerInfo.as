package com.rpgGame.coreData.info.team
{

	/**
	 *
	 * 附近玩家数据
	 * @author EC
	 * 创建时间：2014-3-31 下午6:50:46
	 *
	 */
	public class TeamNearPlayerInfo
	{
		/** 索引 **/
		public var index : uint;
		/** 玩家id **/
		public var id : Number;
		/** 玩家名字 **/
		public var name : String = "";
		/** 职业id **/
		public var raceId : int;
		/** 玩家等级 **/
		public var level : uint;
		/** 战斗力 **/
		public var fighting : int;
		/** 是否有队伍 **/
		public var isInTeam : Boolean = false;
		public var mapX : int;
		public var mapY : int;

		public function TeamNearPlayerInfo()
		{
		}
	}
}