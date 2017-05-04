package com.rpgGame.coreData.cfg.item
{
	import com.rpgGame.coreData.clientConfig.Q_equip_inherit_cost;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	/**
	 * 装备继承
	 * */
	public class EquipJiChengData
	{
		private static var _dataDic:Dictionary;
		public static function setup(data : ByteArray) : void
		{
			_dataDic = new Dictionary();
			
			var arr : Array = data.readObject();
			for each (var info :Q_equip_inherit_cost in arr)
			{
				_dataDic[info.ID] = info;
			}
		}
		
		/**
		 *依据部位和等阶获取相应的数据
		 * */
		public static function getJiChengCfg(kind:int,lv:int):Q_equip_inherit_cost
		{
			for each(var info:Q_equip_inherit_cost in _dataDic)
			{
				if(info.q_kind==kind&&info.q_levelnum==lv)
					return info;
			}
			return null;
		}
	}
}