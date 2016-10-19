package com.rpgGame.coreData.info.map.map2d
{
	public class MapDynamicBlockAreaInfo
	{
		/** 动态阻挡可走范围左上角坐标x */
		public var startX:int;
		/** 动态阻挡可走范围左上角坐标y */
		public var startY:int;
		/**  动态阻挡可走范围右下角坐标x */
		public var endX:int;
		/**  动态阻挡可走范围右下角坐标y */
		public var endY:int;
		/**  动态阻挡的场景显示资源 */
		public var res:String = "";
		
		public function MapDynamicBlockAreaInfo()
		{
		}
	}
}