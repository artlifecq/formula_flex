package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.Q_rank_designation;
	
	import flash.utils.ByteArray;
	
	import org.client.mainCore.ds.HashMap;

	public class RankDesignationData
	{
		private static var _map:HashMap;
		public static function setup(data : ByteArray) : void
		{
			_map = new HashMap();
			var arr : Array = data.readObject();
			for each (var info :Q_rank_designation in arr)
			{
				_map.add(info.q_id,info);
			}
		}
		
		public static function getinfoById(id:int):Q_rank_designation
		{
			return _map.getValue(id) as Q_rank_designation;
		}
	}
}