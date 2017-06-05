package com.rpgGame.coreData.cfg
{
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 *
	 * 客户端触发配置数据
	 * @author L.L.M.Sunny
	 * 创建时间：2016-7-12 下午3:25:12
	 *
	 */
	public class ClientTriggerCfgData
	{
		private static var _map : HashMap = new HashMap();
		private static var _dataDic : Dictionary = new Dictionary();

		public static function setup(data : ByteArray) : void
		{
			var arr : Array = data.readObject();
			var list : Vector.<ClientTrigger>;
			for each (var info : ClientTrigger in arr)
			{
				list = _dataDic[info.sceneId];
				if (!list)
				{
					list = new Vector.<ClientTrigger>();
					_dataDic[info.sceneId] = list;
				}
				list.push(info);
				_map.add(info.id, info);
			}
		}

		public static function getSceneTriggerList(sceneID : uint) : Vector.<ClientTrigger>
		{
			return _dataDic[sceneID];
		}

		public static function getData(id : uint) : ClientTrigger
		{
			return _map.getValue(id);
		}

		public function ClientTriggerCfgData()
		{
		}
	}
}
