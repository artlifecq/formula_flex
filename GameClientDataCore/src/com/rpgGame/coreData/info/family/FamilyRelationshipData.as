package com.rpgGame.coreData.info.family
{
	
	/**
	 * 家族关系
	 * @author luguozheng
	 * 
	 */	
	public class FamilyRelationshipData 
	{
		
		/**这个家族的名字**/
		public var familyName:String;
		/** 这个家族是否是盟族. 否 = 敌族 **/
		public var isFriend:Boolean;
		
		public function FamilyRelationshipData()
		{
		}
	}
}