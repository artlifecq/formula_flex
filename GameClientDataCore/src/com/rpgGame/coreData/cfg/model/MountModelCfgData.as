package com.rpgGame.coreData.cfg.model
{
	import com.rpgGame.coreData.clientConfig.MountModel;

	import flash.utils.ByteArray;

	import org.client.mainCore.ds.HashMap;

	/**
	 *
	 * 坐骑模板配置数据
	 * @author L.L.M.Sunny
	 * 创建时间：2016-9-8 上午10:25:12
	 *
	 */
	public class MountModelCfgData
	{
		private static var _map : HashMap;

		public static function setup(data : ByteArray) : void
		{
			var arr : Array = data.readObject();
			_map = new HashMap();
			for each (var info : MountModel in arr)
			{
				_map.add(info.id, info);
			}
		}

		public static function getInfo(id : int) : MountModel
		{
			return _map.getValue(id);
		}

		public function MountModelCfgData()
		{
		}
	}
}
