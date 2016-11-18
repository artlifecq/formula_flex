package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.ActivityBarInfo;

	import flash.utils.ByteArray;

	import org.client.mainCore.ds.HashMap;

	public class ActivityBarCfgData
	{

		private static var _map:HashMap;
		private static var _list:Array;

		public function ActivityBarCfgData()
		{
		}

		public static function setup( byte:ByteArray ):void
		{
			_list = byte.readObject();
			_map = new HashMap();
			for each ( var info:ActivityBarInfo in _list )
			{
				_map.add( info.key, info );
			}
		}

		/**
		 * 通过定义的活动类型获得对配置
		 * @param activityType
		 * @return
		 */
		public static function getActivityBarInfo( activityType:int ):ActivityBarInfo
		{
			return _map.getValue( ActivityBarInfo ) as ActivityBarInfo;
		}

		/**
		 * 获取所有的活动配置列表
		 * @see ActivityBarInfo
		 * @return
		 */
		public static function get list():Array
		{
			return _list;
		}
	}
}
