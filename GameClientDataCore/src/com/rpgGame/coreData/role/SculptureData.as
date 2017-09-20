package com.rpgGame.coreData.role
{
	import org.game.netCore.data.long;

	/**
	 * 雕塑数据
	 * @author jsj
	 * 
	 */
	public class SculptureData extends RoleData
	{
		/** 第一名玩家id*/
		public var roleId:long;
		/** 模型id*/
		public var modleId:int ;
		
		/** 排行榜类型*/
		public var topType:int ;
		
		public var avatarRes : String;
		
		public var topLeaderTypes: Vector.<int>;
		
		public function SculptureData(type:int)
		{
			super(type);
		}
		
		public function updataTopType(value:int,title:int):void
		{
			topLeaderTypes = new Vector.<int>();
			topLeaderTypes.push(title);
			topType = value;
		}
	}
}