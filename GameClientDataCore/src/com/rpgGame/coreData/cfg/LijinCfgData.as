package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.Q_daysdown_gold;
	import com.rpgGame.coreData.clientConfig.Q_zone_multy;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	/**
	 * 天降元宝数据
	 * @author YT
	 * 
	 */	
	public class LijinCfgData
	{
		
		private static var _dataDic : Dictionary = new Dictionary();
		private static var _idList:Array=new Array();
		public static function setup(data : ByteArray) : void {
			var arr : Array = data.readObject();
			for each(var info :Q_daysdown_gold in arr) {
				_dataDic[info.q_id] = info;
				_idList.push(info.q_id);
			}
		}
		
		public static function getIdList():Array
		{
			return _idList;
		}
		public static function getDaysdownGold(id:int):Q_daysdown_gold
		{
			return _dataDic[id];
		}
		
		
		
		
		
		public function LijinCfgData()
		{
		}
	}
}