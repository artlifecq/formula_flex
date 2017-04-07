package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.Q_notify;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	public class NotifyCfgData
	{
		private static var _dataDic : Dictionary = new Dictionary();
		
		public static function setup(data : ByteArray) : void {
			var arr : Array = data.readObject();
			
			for each(var info : Q_notify in arr) {
				_dataDic[info.q_id] = info;
			}
			
		}
		/**根据消息ID获取消息*/
		public static function getNotifyByID(id : uint,values:Vector.<String>=null) : Q_notify 
		{
			var noti:Q_notify=_dataDic[id];
			if(noti!=null&&values!=null)
			{
				var content:String=noti.q_content;
				content=substitute(content,values);
				noti.q_content=content;
				
			}
			
			return noti;
		}
		
		/**根据消息ID获取消息的文字*/
		public static function getNotifyTextByID(id : uint,values:Vector.<String>=null) :String 
		{
			var noti:Q_notify=_dataDic[id];
			if(noti!=null)
			{
				if(values!=null)
				{
					var content:String=noti.q_content;
					content=substitute(content,values);
					noti.q_content=content;
				}
				return noti.q_content;
			}
			
			return "";
		}
		
        /**字符串替换*/		
		private static function substitute(string:String, value: Vector.<String>=null, start:String="{", end:String="}"):String  
		{  
			if (value == null) return string;  
			var pattern:RegExp=new RegExp(start + "(.*?)" + end, "g");  
			return string.replace(pattern, function():String  
			{  
				if(arguments[1]<value.length)
				{
					return value[arguments[1]];  
				}
				return "";  
			});  
			
		}
		
		public function NotifyCfgData()
		{
		}
	}
}