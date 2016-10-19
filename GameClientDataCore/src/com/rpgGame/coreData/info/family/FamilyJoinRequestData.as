package com.rpgGame.coreData.info.family
{
	
	/**
	 * 家族申请入家族人数据
	 * @author luguozheng
	 * 
	 */	
	public class FamilyJoinRequestData
	{
		public var heroId:Number;
		public var equipmentResources:Number;
		public var level:int;
		public var fightPower:int;
		public var heroName:String = "";
		
		public var deleteTime:Number;
		
		public function FamilyJoinRequestData()
		{
		}
	}
}