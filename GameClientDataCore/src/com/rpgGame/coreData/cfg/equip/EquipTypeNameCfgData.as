package com.rpgGame.coreData.cfg.equip
{
	import com.rpgGame.coreData.clientConfig.EquipTypeNameInfo;
	import com.rpgGame.coreData.clientConfig.SpriteStatNameInfo;
	
	import flash.utils.ByteArray;
	
	import org.client.mainCore.ds.HashMap;
	/**
	 * 装备部件名字 
	 * @author Mandragora
	 * 
	 */
	public class EquipTypeNameCfgData
	{
		public function EquipTypeNameCfgData()
		{
		}
		
		private static var _map : HashMap = new HashMap();
		
		public static function setup(data : ByteArray) : void
		{
			var arr : Array = data.readObject();
			_map = new HashMap();
			for each (var info : EquipTypeNameInfo in arr)
			{
				_map.add(info.value, info);
			}
		}
		/**
		 *  
		 * @param key equipType.key
		 * @return 
		 * 
		 */		
		public static function getTypeName(key:int):String
		{
			var info : EquipTypeNameInfo = _map.getValue(key);
			return info.equipName;
		}
		/**获取图片路径**/
		public static function getTypeNameUrlByKey(key:int):String
		{
			var info : EquipTypeNameInfo = _map.getValue(key);
			return info.equipNameUrl;
		}
		
	}
}