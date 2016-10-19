package com.rpgGame.coreData.info
{

	/**
	 *
	 * 查询地图数据
	 * @author L.L.M.Sunny
	 * 创建时间：2016-06-12 上午10:05:12
	 *
	 */
	public class SearchMapData
	{
		/**
		 * 地图id
		 */
		public var mapId : int = 0;
		/**
		 * x坐标
		 */
		public var posX : Number = 0;
		/**
		 * y坐标
		 */
		public var posY : Number = 0;
		/**
		 * 保持距离
		 */
		public var spacing : int = 0;
		/**
		 * 目标名字
		 */
		public var targetName : String = "";
		/**
		 * 目标坐标X
		 */
		public var targetPosX : Number = 0;
		/**
		 * 目标坐标Y
		 */
		public var targetPosY : Number = 0;

		public function SearchMapData(mapId : int, posX : Number, posY : Number, spacing : int = 0, targetName : String = "", targetPosX : Number = 0, targetPosY : Number = 0)
		{
			this.mapId = mapId;
			this.posX = posX;
			this.posY = posY;
			this.spacing = spacing;
			this.targetName = targetName;
			this.targetPosX = targetPosX;
			this.targetPosY = targetPosY;
		}
	}
}
