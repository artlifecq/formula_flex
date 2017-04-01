package com.gameClient.log
{
    import away3d.log.LogItem;
    
	public class GameLog
	{
		public static const APPEND_TXT:String = "append_txt";
		
		public static var enableShow:Boolean = false;
		public static var max:uint = 1000;//最大日志条数
		public static var enableTrace:Boolean = true;
		
		private static var _logList:Array = [];
		
		private static var _callBackList:Vector.<Function> = new Vector.<Function>;
		private static var _clearCallBackList:Vector.<Function> = new Vector.<Function>;
		
		public function GameLog()
		{
		}
		
		public static function addUpdateCallBack(fun:Function):void
		{
			if(fun != null)
			{
				var index:int = _callBackList.indexOf(fun);
				if(index == -1)
				{
					_callBackList.push(fun);
				}
			}
		}
		
		public static function removeUpdateCallBack(fun:Function):void
		{
			var index:int = _callBackList.indexOf(fun);
			if(index != -1)
			{
				_callBackList.splice(index,1);
			}
		}
		
		public static function addClearCallBack(fun:Function):void
		{
			var index:int = _clearCallBackList.indexOf(fun);
			if(index != -1)
			{
				_clearCallBackList.splice(index,1);
			}
		}
		
		public static function init(enableTrace:Boolean = false,maxLines:uint = 1000):void
		{
			enableTrace = enableTrace;
			max = maxLines;
		}
        
        public static function add2(...args) : void {
            trace(args);
        }
		
		public static function add(...arg):void
		{
			if(enableShow)
			{
				if(_logList.length > max)
				{
					clear();
				}
				_logList.push(arg);
			}
            
            CONFIG::netDebug {
                NetDebug.LOG.apply(null, arg);
            }
			
			if(enableTrace)
			{
				trace(arg);
			}
			
//			if(enableShow)
//			{
//				var str:String = "";
//				for each(var obj:Object in arg)
//				{
//					str += String(obj);
//				}
//				for each(var fun:Function in _callBackList)
//				{
//					fun(str+"\n");
//				}
//			}
		}
		public static function addError(...arg):void
		{
            arg.unshift("[Error]");
            CONFIG::netDebug {
                NetDebug.LOG.apply(null, arg);
            }
			trace("ERROR: " + arg);
		}
		
		public static function throwError(err:*) : void
		{
			//TODO: 这里判断是否是发布环境
			if (true)
			{
				throw err;
			}
		}
		
		public static function assert(verify:Boolean, strErr:String) : void
		{
			//TODO: 这里判断是否是发布环境
			if (true && !verify)
			{
				throw strErr;
			}
		}

		public static function clear():void
		{
			_logList.length = 0;
			for each(var fun:Function in _clearCallBackList)
			{
				if(fun != null)
				{
					fun();
				}
			}
			_clearCallBackList.length = 0;
		}
		
		public static function addShow(...arg):void
		{
			if(_logList.length > max)
			{
				clear();
			}
			_logList.push(arg);
			
			var str:String = "";
			for each(var obj:Object in arg)
			{
				str += String(obj) + " ";
			}
			
            CONFIG::netDebug {
                NetDebug.LOG.apply(null, arg);
            }
			if(enableTrace)
			{
				trace(arg/*,new Date().toString()*/);
			}
			
			for each(var fun:Function in _callBackList)
			{
				fun(str+"\n");
			}
		}
        
        public static function logItem(logItem : LogItem) : void {
            if (enableTrace) {
                trace("[" + logItem.type + "]" + logItem.message);
            }
        }
	}
}