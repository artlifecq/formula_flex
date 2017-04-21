package com.rpgGame.coreData.cfg
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.coreData.clientConfig.Q_att_values;
	import com.rpgGame.coreData.type.CharAttributeType;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	


	/**
	 *属性配置表 
	 * @author dik
	 * 
	 */
	public class AttValueConfig
	{
		private static var _dataDic:Dictionary;
		private static var _attrDic:Dictionary=new Dictionary();
		public function AttValueConfig()
		{
		}
		
		public static function setup( data:ByteArray ):void
		{
			_dataDic = new Dictionary();
			
			var arr : Array = data.readObject();
			
			for each(var info : Q_att_values in arr) {
				_dataDic[info.id] = info;
			}
		}
		
		public static function getAttInfoById(id:int):Q_att_values
		{
			return _dataDic[id] ;
		}
		
		/**
		 *根据类型获得值 
		 * @param id
		 * @param type
		 * @return 
		 * 
		 */
		public static function getQattValueByType(id:int,type:int):int
		{
			var att:Q_att_values=getAttInfoById(id);
			if(!att){
				return 0;
			}
			
			for(var i:int=1;i<CharAttributeType.TYPE_NUM;i++){
				if(att["q_type"+i]==type){
					return att["q_value"+i];
				}
			}
			
			return 0;
		}
		
		public static function getTypeValueMap(att:Q_att_values):HashMap
		{
			if (_attrDic[att.id]!=undefined) 
			{
				return _attrDic[att.id] as HashMap;
			}
			var maps:HashMap=new HashMap();
			for(var i:int=1;i<CharAttributeType.TYPE_NUM;i++){
				if(att["q_type"+i]!=0){//值和类型都存在
					maps.put(att["q_type"+i],att["q_value"+i]);					
				}
			}
			return _attrDic[att.id] =maps;
			return maps;
		}
		public static function getTypeValue(attId:int,retHash:HashMap):void
		{
			if (retHash==null) 
			{
				throw new Error("retHash is null");
			}
			var attr:Q_att_values=getAttInfoById(attId);
			if (attr) 
			{
				var valueH:HashMap=getTypeValueMap(attr);
				if (valueH) 
				{
					var keys:Array=valueH.keys();
					for each (var type:int in keys) 
					{
						if (retHash.containsKey(type)) 
						{
							retHash.put(type,valueH.getValue(type)+retHash.getValue(type));
						}
						else
						{
							retHash.put(type,valueH.getValue(type));
						}
					}
				}
			}
			
		}
	}
}