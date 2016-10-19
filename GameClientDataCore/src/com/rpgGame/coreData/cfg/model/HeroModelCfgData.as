package com.rpgGame.coreData.cfg.model
{
	import com.rpgGame.coreData.clientConfig.HeroModel;

	import flash.utils.ByteArray;

	import org.client.mainCore.ds.HashMap;

	/**
	 *
	 * 英雄模板配置数据
	 * @author L.L.M.Sunny
	 * 创建时间：2015-9-11 上午10:25:12
	 *
	 */
	public class HeroModelCfgData
	{
		private static var _map : HashMap;

		public static function setup(data : ByteArray) : void
		{
			var arr : Array = data.readObject();
			_map = new HashMap();
			for each (var info : HeroModel in arr)
			{
				_map.add(info.id, info);
			}
		}

		public static function getInfo(id : int) : HeroModel
		{
			return _map.getValue(id);
		}

		public function HeroModelCfgData()
		{
		}
	}
}
