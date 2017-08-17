package com.rpgGame.coreData.cfg.mount
{
	/**
	 * 坐骑物种  单元数据
	 * @author 陈鹉光
	 * 
	 */	
	public class MountSpeciesData
	{
		/** 物种id **/
		public var id:int;
		/** 物种名 **/
		public var name:String;
		/** 携带需要等级 **/
		public var requiredLevel:int;
		/** 最大寿命 **/
		public var maxLifeTime:int;
		/** 鉴定银两消耗 **/
		public var indentifyMoneyCost:int;
		
		public function MountSpeciesData()
		{
		}
		
		/**
		 * 设置坐骑物种数据 
		 * @param data
		 * 
		 */		
//		public function setData( data:MountSpeciesDataProto ):void
//		{
//			if( data == null )
//				return;
//			
//			id = data.id;
//			name = data.name;
//			requiredLevel = data.requiredLevel;
//			maxLifeTime = data.maxLifeTime;
//			indentifyMoneyCost = data.indentifyMoneyCost;
//		}
	}
}