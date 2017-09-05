package com.rpgGame.core.events
{
	import flash.events.Event;
	
	public class TeamEvent extends Event
	{
		
		/** 得到组队信息		 */		
		public static const GET_TEAM_INFO:String = "getTeamInfo";
		
		/** 通地图玩家信息		 */		
		public static const GET_MAP_PLAYERS:String = "getMapPlayers";
		
		/** 同地图队伍列表		 */		
		public static const GET_MAP_TEAMS:String = "getMapTeams";
		
		/** 搜索全服玩家		 */		
		public static const SEARCH_PLAYER_BY_SERVER:String = "searchPlayerByServer";
		
		/** 系统设置改变		 */		
		public static const SYSTEM_SET_CHANGE:String = "systemSetChange";
		
		/***组队玩家状态改变**/
		public static const TEAM_MEM_ATTR_CHANGE:String="team_mem_attr_change";
		
		/***组队玩家状态改变**/
		public static const TEAM_SLEECT_TEAM:String="team_select_team";
		
		public var data:*;
		
		public var isCreateTeam:Boolean = false;
		public var isDismissTeam:Boolean  = false;
		
		public function TeamEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}