package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.Q_hecheng;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	import app.message.BoolArrayProto;
	
	import gs.data.VarsCore;
	
	public class HeChengData
	{
		private static var _dataDic : Dictionary;
		
		public static function setup(data : ByteArray) : void
		{
			_dataDic = new Dictionary();
			
			var arr : Array = data.readObject();
			for each (var info :Q_hecheng in arr)
			{
				_dataDic[info.q_id] = info;
			}
		}
		
		/**依据ID获取配置表*/
		public static function getQ_HeChengByID(id:int):Q_hecheng
		{
			return _dataDic[id];
		}
		
		/**依据子类型获取符合条件的配置*/
		public static function getQ_HeChengListBySonType(sonType:int):Vector.<Q_hecheng>
		{
			var list:Vector.<Q_hecheng>=new Vector.<Q_hecheng>();
			for each (var info:Q_hecheng in _dataDic)
			{
				if(info.q_sub_type==sonType)
					list.push(info);
			}
			return list;
		}
		
		/**获取主类型列表*/
		public static function getTypeLiet():Vector.<int>
		{
			var list:Vector.<int>=new Vector.<int>();
			for each(var info:Q_hecheng in _dataDic)
			{
				if(!isHave(list,info.q_type))
				{
					list.push(info.q_type);
				}
			}
			return list;
		}
		
		/**依据主类型获取子类型列表*/
		public static function getSonTypeListByType(type:int):Vector.<int>
		{
			var list:Vector.<int>=new Vector.<int>();
			for each(var info:Q_hecheng in _dataDic)
			{
				if(info.q_type==type&&!isHave(list,info.q_sub_type))
				{
					list.push(info.q_sub_type);
				}
			}
			return list;
		}
		
		/**依据类型获取配置表*/
		public static function getSonbySonTypeListByType(type:int,sontype:int,subsontype:int):Q_hecheng
		{
			for each(var info:Q_hecheng in _dataDic)
			{
				if(info.q_type==type&&info.q_subson_type==sontype&&info.q_subson_type==subsontype)
				{
					return info;
				}
			}
			return null;
		}
		
		private static function isHave(list:Vector.<int>,type:int):Boolean
		{
			if(list==null||list.length<=0) return false;
			for(var i:int=0;i<list.length;i++)
			{
				if(list[i]==type) return true;
			}
			return false;
		}
		
	}
}