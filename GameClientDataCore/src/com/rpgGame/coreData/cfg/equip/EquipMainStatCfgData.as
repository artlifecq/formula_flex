package com.rpgGame.coreData.cfg.equip
{
	import com.rpgGame.coreData.clientConfig.EquipMainStat;
	import com.rpgGame.coreData.clientConfig.EquipTypeNameInfo;
	
	import flash.utils.ByteArray;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 * 装备主属性 
	 * @author Mandragora
	 * 
	 */	
	public class EquipMainStatCfgData
	{
		public function EquipMainStatCfgData()
		{
		}
		private static var _map : HashMap = new HashMap();
		
		public static function setup(data : ByteArray) : void
		{
			if( data == null )
				return;
			
			var arr : Array = data.readObject();
			_map = new HashMap();
			for each (var info : EquipMainStat in arr)
			{
				_map.add(info.statType, info.dispType);
			}
		}
		/**
		 *  
		 * @param key 
		 * @return 
		 * 
		 */		
		public static function getTypeName(key:int):String
		{
			return _map.getValue(key);
		}
	}
}