package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.ActivityBarInfo;
	
	import flash.utils.ByteArray;
	
	import org.client.mainCore.ds.HashMap;

	public class ActivityBarCfgData
	{

		private static var _map:HashMap;

		public function ActivityBarCfgData()
		{
		}

		public static function setup( byte:ByteArray ):void
		{
			var _list:Array = byte.readObject();
			_map = new HashMap();
			for each ( var info:ActivityBarInfo in _list )
			{
				_map.add( info.id, info );
			}
		}

		/**
		 * 根据功能id获取活动条的信息
		 * @param id
		 * @return
		 */
		public static function getActivityBarInfo( id:int ):ActivityBarInfo
		{
			return _map.getValue( id ) as ActivityBarInfo;
		}
	}
}
