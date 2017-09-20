package com.rpgGame.coreData.role
{
	

	/**
	 * 雕塑数据
	 * @author jsj
	 * 
	 */
	public class SculptureData extends RoleData
	{
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
		
		public function updataTopType(value:int):void
		{
			topLeaderTypes = new Vector.<int>();
//			if (roleId!=null&&roleId.IsZero()==false) 
//			{
//				
//			}
			topLeaderTypes.push(value);
			topType = value;
		}
	}
}