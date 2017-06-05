package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.Q_special_activities;
	
	import flash.utils.ByteArray;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 *活动配置数据 
	 * @author dik
	 * 
	 */
	public class ActivetyCfgData
	{
		private static var _typeMap:HashMap;
		
		public function ActivetyCfgData()
		{
		}
		
		public static function setup( data:ByteArray ):void
		{
			_typeMap=new  HashMap();
			var arr : Array = data.readObject();
			var num:int=arr.length;
			var info:Q_special_activities;
			var type:int;
			for(var i:int=0;i<num;i++){
				info=arr[i];
				var list:Vector.<Q_special_activities>=_typeMap.getValue(info.q_activity_type);
				if(!list){
					list=new Vector.<Q_special_activities>();
					_typeMap.add(info.q_activity_type,list);
				}
				list.push(info);
			}
		}
		
		/**
		 *根据活动类型获取对应活动数据 
		 * @param type
		 * @return 
		 * 
		 */
		public static function getActivetyListByType(type:int): Vector.<Q_special_activities>
		{
			return _typeMap.getValue(type);
		}
	}
}