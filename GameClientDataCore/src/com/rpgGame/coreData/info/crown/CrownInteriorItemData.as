package com.rpgGame.coreData.info.crown
{
	import com.rpgGame.coreData.cfg.crown.CrownNeiZhengCfgData;

	/**
	 * 王权内政项数据
	 * @author L.L.M.Sunny
	 * 创建时间：2015-12-22 下午3:50:25
	 *
	 */
	public class CrownInteriorItemData
	{
		public var index : int;
		/**
		 * 可用状态
		 */
		public var availableState : String;
		/**
		 * 持续时长
		 */
		public var time : Number;
		/**
		 * 操作
		 */
		public var operate : Boolean;
		/**
		 * 操作名字 
		 */		
		public var operateStr : String;
		public function CrownInteriorItemData()
		{
		}
		/**
		 * 内政名称
		 */
		public function get interiorName():String
		{
			return CrownNeiZhengCfgData.getNeiZhengName(index);
		}
		
	}
}
