package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.ClientSceneNPC;

	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	/**
	 *
	 * 客户端场景NPC配置数据
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-17 下午3:25:12
	 *
	 */
	public class ClientSceneNpcCfgData
	{
		private static var _dataDic : Dictionary = new Dictionary();

		public static function setup(data : ByteArray) : void
		{
			var arr : Array = data.readObject();
			var list : Vector.<ClientSceneNPC>;
			for each (var info : ClientSceneNPC in arr)
			{
				list = _dataDic[info.sceneID];
				if (!list)
				{
					list = new Vector.<ClientSceneNPC>();
					_dataDic[info.sceneID] = list;
				}
				list.push(info);
			}
		}

		public static function getSceneNpcInfoList(sceneID : uint) : Vector.<ClientSceneNPC>
		{
			return _dataDic[sceneID];
		}

		public function ClientSceneNpcCfgData()
		{
		}
	}
}
