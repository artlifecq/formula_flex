package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.Q_equip_polish;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	/**
	 *装备琢磨配置数据
	 *@author dik
	 *2017-4-14下午7:57:58
	 */
	public class EquipPolishCfgData
	{
		private static var _dataDic:Dictionary;
		
		public static var maxLv:int;
		public static var maxCfg:Q_equip_polish;
		
		public function EquipPolishCfgData()
		{
		}
		
		public static function setup( data:ByteArray ):void
		{
			_dataDic=new Dictionary();
			var arr : Array = data.readObject();
			
			for each(var info : Q_equip_polish in arr) {
				_dataDic[info.q_equip_polish] = info;
				maxLv=maxLv<info.q_equip_polish?info.q_equip_polish:maxLv;
			}
			maxCfg=getPolishCfg(maxLv);
		}
		
		/**
		 *获取琢磨信息 
		 * @param lv
		 * @return 
		 * 
		 */
		public static function getPolishCfg(lv:int):Q_equip_polish
		{
			return _dataDic[lv] ;
		}
	}
}