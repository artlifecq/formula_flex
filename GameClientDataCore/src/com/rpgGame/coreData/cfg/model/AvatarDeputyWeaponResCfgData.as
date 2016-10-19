package com.rpgGame.coreData.cfg.model
{
	import com.rpgGame.coreData.clientConfig.AvatarDeputyWeaponRes;

	import flash.utils.ByteArray;

	import org.client.mainCore.ds.HashMap;

	/**
	 *
	 * 换装副武器资源配置数据
	 * @author L.L.M.Sunny
	 * 创建时间：2015-11-26 上午10:25:12
	 *
	 */
	public class AvatarDeputyWeaponResCfgData
	{
		private static var _map : HashMap;

		public static function setup(data : ByteArray) : void
		{
			var arr : Array = data.readObject();
			_map = new HashMap();
			for each (var info : AvatarDeputyWeaponRes in arr)
			{
				_map.add(info.id, info);
			}
		}

		public static function getInfo(id : int) : AvatarDeputyWeaponRes
		{
			return _map.getValue(id);
		}

		public function AvatarDeputyWeaponResCfgData()
		{
		}
	}
}
