package com.rpgGame.coreData.info.equip
{
	/**
	 * 装备打造树中的数据 
	 * @author Mandragora
	 * 
	 */	
	public class EquipTreeNodeInfo
	{
		public function EquipTreeNodeInfo()
		{
		}
		/**
		 * 装备id 
		 */		
		public var cfgId : int;
		
		public var name : String;
		
		public var level : int;
		
		public var sex : int;
		
		public var race : int;
		
		public var type : int;
		
		public var makeCount : int;
	}
}