package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.ClientDialog;

	import flash.utils.ByteArray;

	import org.client.mainCore.ds.HashMap;

	/**
	 *
	 * 客户端对话配置数据
	 * @author L.L.M.Sunny
	 * 创建时间：2016-7-20 下午3:25:12
	 *
	 */
	public class ClientDialogCfgData
	{
		private static var _map : HashMap = new HashMap();

		public static function setup(data : ByteArray) : void
		{
			var arr : Array = data.readObject();
			for each (var info : ClientDialog in arr)
			{
				_map.add(info.id, info);
			}
		}

		public static function getData(id : uint) : ClientDialog
		{
			return _map.getValue(id);
		}

		public function ClientDialogCfgData()
		{
		}
	}
}
