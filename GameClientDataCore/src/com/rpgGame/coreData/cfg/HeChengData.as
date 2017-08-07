package com.rpgGame.coreData.cfg
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.coreData.clientConfig.Q_hecheng;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	public class HeChengData
	{
		private static var _nameDic:Dictionary;
		private static var _caiLiaoMap:Dictionary;
		private static var _targetMap:Dictionary;
		
		public static function setup(data : ByteArray) : void
		{
			_nameDic=new Dictionary();
			_caiLiaoMap=new Dictionary();
			var arr : Array = data.readObject();
			_targetMap=new Dictionary();
			for each (var info :Q_hecheng in arr)
			{
				_nameDic[info.q_type+"_"+info.q_sub_type]=info.q_sub_name;
				var items:Array=JSONUtil.decode(info.q_cost_items);
				_caiLiaoMap[items[0]]=info;
				_targetMap[info.q_item_id]=info;
			}
		}
		
		/**
		 *根据目标id获取合成目标 
		 * @return 
		 * 
		 */
		public static function getHeChengTargetByTragetId(id:int):Q_hecheng
		{
			return _targetMap[id];
		}
		
		/**
		 *根据材料获取合成目标 
		 * @param id
		 * @return 
		 * 
		 */
		public static function getHeChengTargetByCaiLiao(id:int):Q_hecheng
		{
			return _caiLiaoMap[id];
		}
		
		
		/**
		 *获取子节点名称 
		 * @param type
		 * @param subType
		 * @return 
		 * 
		 */
		public static function getSubName(type:int,subType:int):String
		{
			return _nameDic[type+"_"+subType];
		}
		
		
		/**依据子类型获取符合条件的配置*/
		public static function getQ_HeChengListBySonType(type:int,sonType:int):Vector.<Q_hecheng>
		{
			var list:Vector.<Q_hecheng>=new Vector.<Q_hecheng>();
			for each (var info:Q_hecheng in _targetMap)
			{
				if(info.q_type==type&&info.q_sub_type==sonType)
					list.push(info);
			}
			return list;
		}
		
		/**获取主类型列表*/
		public static function getTypeList():Array
		{
			var list:Array=new Array();
			for each(var info:Q_hecheng in _targetMap)
			{
				if(!isHave(list,info.q_type))
				{
					list.push(info.q_type);
				}
			}
			return list;
		}
		
		/**依据主类型获取子类型列表*/
		public static function getSonTypeListByType(type:int):Array
		{
			var list:Array=new Array();
			for each(var info:Q_hecheng in _targetMap)
			{
				if(info.q_type==type&&!isHave(list,info.q_sub_type))
				{
					list.push(info.q_sub_type);
				}
			}
			return list;
		}
		
		/**
		 *获取根节点数据 
		 * @param type
		 * @param sontype
		 * @param subsontype
		 * @return 
		 * 
		 */
		public static function getSubSonList(type:int,sontype:int):Array
		{
			var list:Array=new Array();
			for each(var info:Q_hecheng in _targetMap)
			{
				if(info.q_type==type&&info.q_sub_type==sontype&&!isHave(list,info.q_subson_type))
				{
					list.push(info.q_subson_type);
				}
			}
			list.sort(short);
			return list;
		}
		
		private static function short(n1:int,n2:int):int
		{
			if(n1<n2) return -1;
			else if(n1>n2) return 1;
			return 0;
		}
		
		/**依据类型获取配置表*/
		public static function getSonbySonTypeListByType(type:int,subType:int,subsontype:int):Q_hecheng
		{
			for each(var info:Q_hecheng in _targetMap)
			{
				if(info.q_type==type&&info.q_sub_type==subType&&info.q_subson_type==subsontype)
				{
					return info;
				}
			}
			return null;
		}
		
		private static function isHave(list:Array,type:int):Boolean
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