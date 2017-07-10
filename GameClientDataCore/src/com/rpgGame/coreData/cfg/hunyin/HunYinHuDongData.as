package com.rpgGame.coreData.cfg.hunyin
{
	import com.rpgGame.coreData.clientConfig.Q_interaction;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	/**
	 * 婚姻互动消耗表
	 * */
	public class HunYinHuDongData
	{
		private static var _dataDic : Dictionary;
		public static function setup(data : ByteArray) : void
		{
			_dataDic = new Dictionary();
			var arr : Array = data.readObject();
			for each (var info :Q_interaction in arr)
			{
				_dataDic[info.q_type_number] = info;
			}
		}
		
		/**
		 * 判断是否能点
		 * */
		public static function isCanClick(type:int,num:int,vipLv:int):Boolean
		{
			return true;
			var id:String=type.toString()+"_"+num.toString();
			var q_interaction:Q_interaction=_dataDic[id];
			if(q_interaction==null) return false;
			if(q_interaction.q_vip_Num >= vipLv) return true;
			return false;
		}
		
		/**
		 * 获取配置表
		 * */
		public static function getModById(type:int,num:int):Q_interaction
		{
			var id:String=type.toString()+"_"+num.toString();
			return _dataDic[id];
		}
	}
}