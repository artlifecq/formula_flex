package com.rpgGame.coreData.cfg.res
{
	import com.rpgGame.coreData.clientConfig.AvatarResConfig;

	import flash.utils.ByteArray;

	import org.client.mainCore.ds.HashMap;

	/**
	 *
	 * 换装资源配置集合数据
	 * @author L.L.M.Sunny
	 * 创建时间：2016-05-25 上午10:25:12
	 *
	 */
	public class AvatarResConfigSetData
	{
		private static var _map : HashMap;

		public static function setup(data : ByteArray) : void
		{
			var arr : Array = data.readObject();
			_map = new HashMap();
			for each (var info : AvatarResConfig in arr)
			{
				_map.add(info.res, info);
			}
		}

		public static function getInfo(res : String) : AvatarResConfig
		{
			return _map.getValue(res);
		}

		public function AvatarResConfigSetData()
		{
		}
	}
}
