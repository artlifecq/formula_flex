package com.game.engine3D.utils
{
	import com.game.engine3D.manager.Stage3DLayerManager;
	
	import flash.display.Stage;
	
	import away3d.core.managers.Stage3DProxy;
	import away3d.debug.AwayStats;
	
	/**
	 *
	 * 性能监测工具
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-19 下午2:05:12
	 *
	 */
	public class StatsUtil
	{
		/** 3D监测工具 **/
		private static var _awayStatView : AwayStats;
		
		public function StatsUtil()
		{
		}
		
		/**
		 * 显示3D监测工具
		 *
		 */
		public static function showAwayStats(stage : Stage, stage3DProxy : Stage3DProxy = null) : void
		{
			if (stage3DProxy == null)
			{
				stage3DProxy = Stage3DLayerManager.stage3DProxy;
			}
			
			if (_awayStatView == null)
			{
				_awayStatView = new AwayStats(stage3DProxy);
			}
			
			if (_awayStatView.parent == null)
			{
				stage.addChild(_awayStatView);
				_awayStatView.x = 0;
				_awayStatView.y = 400;
			}
		}
		
		/**
		 * 隐藏3D监测工具
		 *
		 */
		public static function hideAwayStats() : void
		{
			if (_awayStatView && _awayStatView.parent)
			{
				_awayStatView.parent.removeChild(_awayStatView);
			}
		}
	}
}
