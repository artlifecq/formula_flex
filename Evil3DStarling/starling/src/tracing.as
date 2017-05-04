package{
	

	/**
	 *@全局log函数
	 * 
	 *@author:wewell 
	 * 
	 */    
	
	/**
	 * 全局函数,即时日志输出及日志缓存
	 * 
	 * 添加并输出一条日志tracing(...args)
	 * 
	 * 保存并返回全部日志: tracing("exportLogs")
	 *  
	 */
	public function tracing(...args):Object
	{
		if(args[0] == "exportLogs")
			return LogData.exportLogs();
		
		return LogData.add(args);
	}
}

import flash.net.FileReference;

import away3d.tick.Tick;

class LogData{
	private static const MAX:int = 5000;
	private static var id:int;
	private static var datas:Vector.<Object> = new Vector.<Object>(MAX);
	
	public var time:String;
	public var log:Object;
	
	/**
	 * 输出并记录一条信息,限于debug版打印日志，否则不打印
	 * @param log 
	 */	
	public static function add(log:Object):Object{
		var ld:LogData = new LogData(log);
		var i:int = id >= MAX ? id%MAX : id;
		datas[i] = ld;
		
		CONFIG::Starling_Debug{
			var str:String = ld.toString();
			datas[i] = str;
			trace(str);
		}
	
		id++;
		return ld;
	}
	
	public function LogData(log:Object){
		this.time =  new Date().toLocaleTimeString() +" "+ Tick.instance.time;
		this.log = log;
	}
	
	//private const HEAD:RegExp = /com.cndw.xianhun.mvc.dto./g;
	public function toString():String{
		var str:String = "";
		for each(var s:Object in log){
			str += JSON.stringify(s) + " ";
		}
		//str = str.replace(HEAD, "");
		return "[" + time + "] " + str;
	}
	
	//导出日志文本
	public static function exportLogs():String{
		var file:FileReference=new FileReference;
		var msgs:Vector.<String> = new Vector.<String>;
		var i:int=0;
		var ld:Object;
		if(id >= datas.length){//日志已满，早期日志被覆盖了
			for(i=0; i<MAX; i++){
				ld = datas[i];
				msgs[i] = ld.toString();
			}
		}else{//日志未满
			for(i=0; i<id; i++){
				ld = datas[i];
				msgs[i] = ld.toString();
			}
		}
		var logs:String = msgs.join("\r\n");
		
		try{
			var fileName:String = "starling_log_" + new Date().toLocaleTimeString().replace(/:/g, "") + ".txt";
			file.save( logs, fileName);
		}catch(error:Error){
			tracing("need Flash Player version 10.0");
		}
		return logs;
	}
}
