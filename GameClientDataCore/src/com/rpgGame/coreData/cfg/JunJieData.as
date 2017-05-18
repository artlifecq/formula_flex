package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.Q_junjie;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	public class JunJieData
	{
		private static var _dataDic : Dictionary;
		private static var _maxLv:int=0;
		
		public static function setup(data : ByteArray) : void
		{
			_dataDic = new Dictionary();
			var arr : Array = data.readObject();
			for each (var info :Q_junjie in arr)
			{
				_dataDic[info.q_id] = info;
				if(_maxLv<info.q_id) _maxLv=info.q_id;
			}
		}
		
		/**
		 * 依据等阶获取配置
		 * */
		public static function getModByLv(lv:int):Q_junjie
		{
			return _dataDic[lv];
		}
		
		/**
		 * 获取最大等阶
		 * */
		public static function getMaxLv():int
		{
			return _maxLv;
		}
		
		/**
		 * 获取显示列表 @starLv 起始等级 @num 提取数量
		 * */
		public static function getShowItemList(starLv:int,num:int):Vector.<int>
		{
			var list:Vector.<int>=new Vector.<int>();
			if((starLv+num)>_maxLv)
			{
				starLv=_maxLv-1-num;
			}
			for(var i:int=0;i<num;i++)
			{
				list.push(starLv+i);
			}
			return list;
		}
		
		/**
		 * 依据ID获取称号
		 * */
		public static function getEffById(id:int):String
		{
			return (_dataDic[id] as Q_junjie).q_effect;
		}
	}
}