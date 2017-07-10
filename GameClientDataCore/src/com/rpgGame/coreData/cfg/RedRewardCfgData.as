package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.Q_redreward;
	
	import flash.utils.ByteArray;
	
	import org.client.mainCore.ds.HashMap;

	public class RedRewardCfgData
	{
		private static var _map:HashMap;
		public static function setup( byte:ByteArray ):void
		{
			var arr:Array = byte.readObject();
			_map = new HashMap();
			for each ( var info:Q_redreward in arr )
			{
				_map.add( info.q_id, info );
			}
		}
		public static function getdataById(id:int):Q_redreward
		{
			return _map.getValue(id) as Q_redreward;
		}
	}
	
	
}