package com.rpgGame.coreData.cfg.item
{
	import com.rpgGame.coreData.clientConfig.Q_equip_wash_attr;
	
	import flash.utils.ByteArray;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 *
	 *@author dik
	 *2017-4-18下午7:01:58
	 */
	public class EquipWashAttCfg
	{
		private static var _allData:HashMap;
		public function EquipWashAttCfg()
		{
		}
		
		public static function setup( data:ByteArray ):void
		{
			_allData=new HashMap();
			var arr : Array = data.readObject();
			
			for each(var info : Q_equip_wash_attr in arr) {
				_allData.add(info.q_id,info);
			}
		}
		
		public static function getEquipWashAttr(id:int):Q_equip_wash_attr
		{
			return _allData.getValue(id);
		}
	}
}