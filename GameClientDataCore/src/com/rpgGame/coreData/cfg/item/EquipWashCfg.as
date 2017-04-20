package com.rpgGame.coreData.cfg.item
{
	import com.rpgGame.coreData.clientConfig.Q_equip_wash;
	import com.rpgGame.coreData.clientConfig.Q_item;
	
	import flash.utils.ByteArray;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 *装备洗炼
	 *@author dik
	 *2017-4-18下午6:29:16
	 */
	public class EquipWashCfg
	{
		public function EquipWashCfg()
		{
		}
		
		private static var _allData:HashMap;
		private static var _lvData:HashMap;
		public static var washItems:Array;
		
		public static function setup( data:ByteArray ):void
		{
			_allData=new HashMap();
			_lvData=new HashMap();
			var arr : Array = data.readObject();
			for each(var info : Q_equip_wash in arr) {
				_allData.add(info.q_levelnum+"_"+info.q_kind,info);
				_lvData.add(info.q_levelnum,info.q_item_id);
			}
			washItems=_lvData.getValues();
		}
		
		public static function getCfgByLvAndKind(lv:int,kind:int):Q_equip_wash
		{
			return _allData.getValue(lv+"_"+kind);
		}
	}
}