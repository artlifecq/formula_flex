package com.rpgGame.coreData.cfg.hunyin
{
	import com.rpgGame.coreData.clientConfig.Q_advance_wedding;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	/**
	 * 结婚戒子升阶数据
	 * */
	public class JieHunJieZiData
	{
		private static var _dataDic : Dictionary;
		private static var _maxLv:int=0;
		public static function setup(data : ByteArray) : void
		{
			_dataDic = new Dictionary();
			var arr : Array = data.readObject();
			for each (var info :Q_advance_wedding in arr)
			{
				_dataDic[info.q_id] = info;
				if(_maxLv<info.q_strength)
					_maxLv=info.q_strength;
			}
		}
		
		/**
		 * 最大等级
		 * */
		public static function get maxLv():int
		{
			return _maxLv;
		}
		
		/**
		 * 是否是最大等级
		 * */
		public static function isMax(lv:int):Boolean
		{
			return lv >= _maxLv;
		}
		
		/**
		 * 依据等级获取配置表
		 * */
		public static function getModByLv(lv:int):Q_advance_wedding
		{
			return _dataDic[lv];
		}
	}
}