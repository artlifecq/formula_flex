package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.ClientScene;

	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	/**
	 *
	 * 客户端场景配置数据
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-17 下午3:25:12
	 *
	 */
	public class ClientSceneCfgData
	{
		private static var _dataDic : Dictionary = new Dictionary();

		public static function setup(data : ByteArray) : void
		{
			var arr : Array = data.readObject();
			for each (var info : ClientScene in arr)
			{
				_dataDic[info.q_map_id] = info;
			}
		}

		public static function getSceneInfo(sceneID : uint) : ClientScene
		{
			return _dataDic[sceneID];
		}

		public function ClientSceneCfgData()
		{
		}
	}
}
