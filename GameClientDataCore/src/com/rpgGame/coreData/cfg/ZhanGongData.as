package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.Q_meritorious;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	public class ZhanGongData
	{
		private static var _dataDic : Dictionary;
		private static var _nameDic:Dictionary;
		
		public static function setup(data : ByteArray) : void
		{
			_dataDic = new Dictionary();
			_nameDic=new Dictionary();
			var arr : Array = data.readObject();
			for each (var info :Q_meritorious in arr)
			{
				_dataDic[info.q_id] = info;
			}
		}
		
		/**
		 * 获取可显示的等级列表
		 * */
		public static function getMapItemLvList():Vector.<int>
		{
			var list:Vector.<int>=new Vector.<int>();
			for each(var info:Q_meritorious in _dataDic)
			{
				if(!isHave(list,info.q_level))
					list.push(info.q_level);
			}
			list.sort(short);
			return list;
		}
		
		private static function short(a1:int,a2:int):int
		{
			if(a1>a2) return 1;
			else return 0;
		}
		
		/**
		 * 依据等级获取相应的类型
		 * */
		public static function getBossItemTypeList(lv:int):Vector.<int>
		{
			var list:Vector.<int>=new Vector.<int>();
			for each(var info:Q_meritorious in _dataDic)
			{
				if(info.q_level==lv&&!isHave(list,info.q_type))
				{
					list.push(info.q_type);
				}
			}
			return list;
		}
		
		/**
		 * 依据ID获取配置表
		 * */
		public static function getmeritoriousById(id:String):Q_meritorious
		{
			return _dataDic[id];
		}
		
		/**
		 * 依据类型获取相应的最大等级
		 * */
		public static function getMaxLvByType(type:int):int
		{
			for each(var info:Q_meritorious in _dataDic)
			{
				if(info.q_type==type&&info.q_num==0)
				{
					var lv:int=parseInt(info.q_id.split('_')[0]);
					return lv;
				}
			}
			return 0;
		}
		
		/**
		 * 获取某种类型当前等级升到下一级所需要的材料数量
		 * */
		public static function getLvByNexNum(id:String):int
		{
			var info:Q_meritorious=_dataDic[id];
			if(info==null) return 0;
			return info.q_num;
		}
		
		/**
		 * 是否是当前的最大等级
		 * */
		public static function isMax(type:int,lv:int):Boolean
		{
			if(lv>=getMaxLvByType(type)) return true;
			return false;
		}
		
		private static function isHave(list:Vector.<int>,num:int):Boolean
		{
			if(list==null||list.length<=0) return false;
			for(var i:int=0;i<list.length;i++)
			{
				if(list[i]==num) return true;
			}
			return false;
		}
	}
}