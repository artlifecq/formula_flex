package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.ClientSceneEffect;

	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	import org.client.mainCore.ds.HashMap;

	/**
	 *
	 * 客户端场景特效配置数据
	 * @author L.L.M.Sunny
	 * 创建时间：2016-7-12 下午3:25:12
	 *
	 */
	public class ClientSceneEffectCfgData
	{
		private static var _map : HashMap = new HashMap();
		private static var _dataDic : Dictionary = new Dictionary();

		public static function setup(data : ByteArray) : void
		{
			var arr : Array = data.readObject();
			var list : Vector.<ClientSceneEffect>;
			for each (var info : ClientSceneEffect in arr)
			{
				list = _dataDic[info.sceneID];
				if (!list)
				{
					list = new Vector.<ClientSceneEffect>();
					_dataDic[info.sceneID] = list;
				}
				list.push(info);
				_map.add(info.id, info);
			}
		}

		public static function getSceneEffectInfoList(sceneID : uint) : Vector.<ClientSceneEffect>
		{
			return _dataDic[sceneID];
		}

		public static function getData(id : uint) : ClientSceneEffect
		{
			return _map.getValue(id);
		}

		public function ClientSceneEffectCfgData()
		{
		}
	}
}
