package com.rpgGame.coreData.cfg
{
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
	}
}