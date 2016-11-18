package com.rpgGame.coreData.cfg.model
{
	import com.rpgGame.coreData.clientConfig.AvatarClothesEffectRes;

	import flash.utils.ByteArray;

	import org.client.mainCore.ds.HashMap;

	/**
	 *
	 * 换装衣服特效资源配置数据
	 * @author L.L.M.Sunny
	 * 创建时间：2016-9-21 上午10:25:12
	 *
	 */
	public class AvatarClothesEffectResCfgData
	{
		private static var _map : HashMap;

		public static function setup(data : ByteArray) : void
		{
			var arr : Array = data.readObject();
			_map = new HashMap();
			for each (var info : AvatarClothesEffectRes in arr)
			{
				_map.add(info.id, info);
			}
		}

		public static function getInfo(id : int) : AvatarClothesEffectRes
		{
			return _map.getValue(id);
		}

		public function AvatarClothesEffectResCfgData()
		{
		}
	}
}
