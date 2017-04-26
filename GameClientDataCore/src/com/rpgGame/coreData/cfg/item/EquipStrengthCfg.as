package com.rpgGame.coreData.cfg.item
{
	import com.rpgGame.coreData.clientConfig.Q_equip_strength;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	/**
	 *装备强化
	 *@author dik
	 *2017-4-10下午4:07:57
	 */
	public class EquipStrengthCfg
	{
		public function EquipStrengthCfg()
		{
		}
		
		private static var _dataDic:Dictionary;
		
		public static function setup( data:ByteArray ):void
		{
			_dataDic = new Dictionary();
			
			var arr : Array = data.readObject();
			
			for each(var info : Q_equip_strength in arr) {
				var key:String=getKey(info.q_kind,info.q_job,info.q_strength);
				_dataDic[key] = info;
			}
		}
		
		/**
		 *获取强化配置 
		 * @param kind
		 * @param job
		 * @param streng
		 * @return 
		 * 
		 */
		public static function getStrengthCfg(kind:int,job:int,streng:int):Q_equip_strength
		{
			var key:String=getKey(kind,job,streng);
			return _dataDic[key];
		}
		
		/**
		 *部位+职业+等级 
		 * @param kind
		 * @param job
		 * @param streng
		 * @return 
		 * 
		 */
		private static function getKey(kind:int,job:int,strength:int):String
		{
			var key:String=kind+"_"+job+"_"+strength;
			return key;
		}
	}
}