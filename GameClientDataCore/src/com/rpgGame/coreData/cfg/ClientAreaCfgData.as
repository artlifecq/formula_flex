package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.ClientArea;

	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	import org.client.mainCore.ds.HashMap;

	/**
	 *
	 * 客户端区域配置数据
	 * @author L.L.M.Sunny
	 * 创建时间：2016-7-25 下午3:25:12
	 *
	 */
	public class ClientAreaCfgData
	{
		private static var _map : HashMap = new HashMap();
		private static var _dataDic : Dictionary = new Dictionary();

		public static function setup(data : ByteArray) : void
		{
			var arr : Array = data.readObject();
			var list : Vector.<ClientArea>;
			for each (var info : ClientArea in arr)
			{
				list = _dataDic[info.sceneId];
				if (!list)
				{
					list = new Vector.<ClientArea>();
					_dataDic[info.sceneId] = list;
				}
				list.push(info);
				_map.add(info.id, info);
			}
		}

		public static function getSceneAreaList(sceneID : uint) : Vector.<ClientArea>
		{
			return _dataDic[sceneID];
		}

		public static function getData(id : uint) : ClientArea
		{
			return _map.getValue(id);
		}

		public function ClientAreaCfgData()
		{
		}
	}
}
