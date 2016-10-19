package com.rpgGame.coreData.info.map.map2d
{
	/**
	 *
	 * 场景上玩家的位置信息，用于在世界地图上显示，自己国家，队友，好友的位置
	 * @author fly.liuyang
	 * 创建时间：2014-12-17 下午9:47:31
	 * 
	 */
	public class MapPlayerPositionInfo
	{
		public var posX:int;
		public var posY:int;
		public var type:int;
		public var posKey:String;
		public var guanYuanType:int;
		
		public function MapPlayerPositionInfo()
		{
		}
	}
}