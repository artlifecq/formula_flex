package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.ClientSceneRole;
	
	import flash.utils.ByteArray;
	
	import org.client.mainCore.ds.HashMap;
	
	/**
	 * 客户端场景动态角色配置数据
	 * GuoDong.Zhang
	 * 2016-8-9
	 */
	public class ClientSceneRoleCfgData
	{
		private static var _map : HashMap = new HashMap();
		
		public static function setup(data:ByteArray) : void
		{
			var arr : Array = data.readObject();
			for each (var info : ClientSceneRole in arr)
			{
				_map.add(info.id, info);
			}
		}
		
		public static function getData(id:uint):ClientSceneRole
		{
			return _map.getValue(id);
		}

	}
}