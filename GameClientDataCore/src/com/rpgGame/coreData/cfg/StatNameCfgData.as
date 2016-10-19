package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.SpriteStatNameInfo;

	import flash.utils.ByteArray;

	import org.client.mainCore.ds.HashMap;

	public class StatNameCfgData
	{
		public function StatNameCfgData()
		{
		}
		private static var _map : HashMap = new HashMap();

		public static function setup(data : ByteArray) : void
		{
			var arr : Array = data.readObject();
			_map = new HashMap();
			for each (var info : SpriteStatNameInfo in arr)
			{
				_map.add(info.value, info);
			}
		}

		/**
		 *
		 * @param key stattype.key
		 * @return
		 *
		 */
		public static function getStatName(key : int) : String
		{
			var info : SpriteStatNameInfo = _map.getValue(key);
			if (info)
				return info.equip;
			return "未配置类型" + key;
		}
	}
}
