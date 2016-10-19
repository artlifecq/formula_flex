package com.rpgGame.app.utils
{
	import com.rpgGame.app.manager.time.SystemTimeManager;
	
	import org.client.mainCore.ds.HashMap;
	
	import utils.TimerServer;

	/**
	 * 数据失效工具 
	 * @author Mandragora
	 * 
	 */
	public class DataInvalidUtil
	{
		public function DataInvalidUtil()
		{
		}
		
		private static var _dataHashMap : HashMap;
		private static var _isStart : Boolean = false;
		/**
		 * 设置数据失效
		 * @param type 外部自定义类型
		 * @param key 数据对应的key
		 * @param data 实际数据
		 * @param invalidTime 多久后过期
		 * 
		 */		
		public static function setData(type:String,key:*,data:*,invalidTime:Number = 1200):void
		{
			if(!_isStart)
			{
				TimerServer.addSecTick(update,null,30);
				_dataHashMap = new HashMap();
				_isStart = true;
			}
			var array : Array = _dataHashMap.getValue(type);
			if(!array)
			{
				array = [];
				_dataHashMap.add(type,array);
			}
			var temp : invalidTeamData = new invalidTeamData();
			temp.data = data;
			temp.key = key;
			temp.time = SystemTimeManager.curtTm + invalidTime;
			array.push(temp);
		}
		
		private static function update():void
		{
			var i : int;
			var array : Array;
			var temp : invalidTeamData;
			var dels : Array;
			var time : Number = SystemTimeManager.curtTm;
			for each(array in _dataHashMap.getValues())
			{
				for(i=array.length;i<=0;i--)
				{
					temp = array[i];
					if(!temp)
						continue;
					if(temp.time>time)
						array.splice(i,1);
				}
			}
		}
		/**获取指定类型的所有数据，并且可以限制是否需要过期**/
		public static function getDatas(type:String,isInvalid:Boolean = false):Array
		{
			var datas : Array = _dataHashMap.getValue(type);
			var result : Array = [];
			var time : Number = SystemTimeManager.curtTm;
			for each(var temp : invalidTeamData in datas)
			{
				if(isInvalid && temp.time<time)
					continue;
				result.push(temp.data);
			}
			return result;
		}
		/**通过类型和key获取一个数据**/
		public static function getData(type:String,key:*):*
		{
			var datas : Array = _dataHashMap.getValue(type);
			var time : Number = SystemTimeManager.curtTm;
			for each(var temp : invalidTeamData in datas)
			{
				if(key == temp.key)
					return temp.data;
			}
			return null;
		}
	}
}
class invalidTeamData
{
	public function invalidTeamData()
	{
		
	}
	/**过期时间**/
	public var time : Number;
	/**数据key**/
	public var key : *;
	/**实际数据**/
	public var data : *;
	
		
}