package com.rpgGame.coreData.info.map.map2d.cursor
{
	import flash.geom.Point;

	/**
	 *
	 * 系统鼠标信息
	 * @author fly.liuyang
	 * 创建时间：2014-5-14 下午10:56:15
	 * 
	 */
	public class SystemCursorInfo
	{
		private var _hotSpot:Point;
		private var _upFrame:int;
		/**
		 * 鼠标按下状态的帧数。 如果没有按下状态就传0 
		 */		
		private var _downFrame:int;
		/**
		 * 鼠标up状态的帧频率,有多张图的时候才需要设置, 注意啊,这个帧的频和flash的貌似不一样,一般,2或3吧
		 */		
		private var _upFrameRate:int;
		/**
		 * 鼠标按下状态的帧频率,有多张图的时候才需要设置,注意啊,这个帧的频和flash的貌似不一样,一般,2或3吧
		 */		
		private var _downFrameRate:int;
		
		/**
		 *  
		 * @param $hotSpot
		 * @param $upFrame
		 * @param $downFrame 鼠标按下状态的帧数。 如果没有按下状态就传0 
		 * 
		 */		
		public function SystemCursorInfo($hotSpot:Point, $upFrame:int,$downFrame:int,$upFreameRate:int,$downFrameRate:int)
		{
			_hotSpot = $hotSpot;
			_upFrame = $upFrame;
			_downFrame = $downFrame;
			_upFrameRate = $upFreameRate;
			_downFrameRate = $downFrameRate
		}

		public function get downFrameRate():int
		{
			return _downFrameRate;
		}

		/**
		 * 鼠标up状态的帧频率
		 */
		public function get upFrameRate():int
		{
			return _upFrameRate;
		}

		/**
		 * 热点 
		 */
		public function get hotSpot():Point
		{
			return _hotSpot;
		}

		public function get downFrame():int
		{
			return _downFrame;
		}

		/**
		 * 有多少帧 
		 */
		public function get upFrame():int
		{
			return _upFrame;
		}


	}
}