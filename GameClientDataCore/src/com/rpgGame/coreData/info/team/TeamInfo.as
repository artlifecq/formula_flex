package com.rpgGame.coreData.info.team
{
	/**
	 *
	 * 队伍数据
	 * @author EC
	 * 创建时间：2014-3-31 下午6:25:15
	 *
	 */
	public class TeamInfo
	{
		/** 队伍索引 **/
		public var index : uint;
		/** 队伍ID **/
		public var teamID : int = -1;
		/** 队长名字 **/
		public var leaderName : String;
		/** 队长id **/
		public var leaderId : Number;
		/** 队长等级 **/
		public var leaderLv : int;
		/** 队员列表 **/
		public var teamMemberInfolist : Vector.<TeamUnit>;
		/** 平均等级 **/
		public var averageLv : int;
		/** 跟队长在同一个场景的人数 **/
		public var inSameMapNum : int;
		/** 队伍人数 **/
		public var teamNumber : int;

		public function TeamInfo()
		{
			teamMemberInfolist = new Vector.<TeamUnit>();
			reset();
		}

		/**队伍人数*/
		public function get memberCount() : uint
		{
			return teamMemberInfolist.length;
		}

		public function reset() : void
		{
			teamID = -1;
			leaderId = 0;
			leaderLv = 0;
			leaderName = "";
			teamMemberInfolist.length = 0;
		}
	}
}
