package org.game.netCore.net
{
	import avmplus.getQualifiedClassName;
	
	import supports.utils.HashMap;
	
	import flash.desktop.Clipboard;
	import flash.desktop.ClipboardFormats;

	public class MessageRecordModule
	{
		private var _mapList:HashMap = new HashMap();
		private var _mapListSend:HashMap = new HashMap();
		
		public static var IS_OPEN:Boolean = false;
		public static var IS_OPEN_SEND:Boolean = false;
		public static var ins:MessageRecordModule;
		
		public function MessageRecordModule()
		{
			ins = this;
		}
		
		public function tryAdd(hndmsg:*, t:int):void
		{
			if (IS_OPEN)
			{
				var msgName:String = "";
				if (hndmsg != null)
					msgName = getQualifiedClassName(hndmsg);
				
				addRecord(msgName, t);
			}
		}
		
		public function tryAddSend(hndmsg:*, t:int):void
		{
			if (IS_OPEN_SEND)
			{
				var msgName:String = "";
				if (hndmsg != null)
					msgName = getQualifiedClassName(hndmsg);
				
				addRecordSend(msgName, t);
			}
		}
		
		private function addRecord(name:String, t:int):void
		{
			var vo:RecordVo = _mapList.get(name) as RecordVo;
			if (vo == null)
			{
				vo = new RecordVo();
				vo.name = name;
				_mapList.put(name, vo);
			}
			
			if (t > vo.maxtime)
				vo.maxtime = t;
			vo.count++;
			vo.alltime += t;
			vo.avtime = vo.alltime / vo.count;
		}
		
		private function addRecordSend(name:String, t:int):void
		{
			var vo:RecordVo = _mapListSend.get(name) as RecordVo;
			if (vo == null)
			{
				vo = new RecordVo();
				vo.name = name;
				_mapListSend.put(name, vo);
			}
			
			vo.count++;
		}
		
		public function getDebbugInfo(type:int = 0):String
		{
			var ret:String = ("name	avtime	count	alltime	maxtime\n" );
			var ret2:String = "";
			var values:Array = _mapList.values();
			if (type == 4)
				values.sort(sortfunc4);
			else if (type == 3)
				values.sort(sortfunc3);
			else if (type == 2)
				values.sort(sortfunc2);
			else 
				values.sort(sortfunc1);
			
			for (var i:int = 0; i < values.length; i++)
			{
				var vo:RecordVo = values[i];
				ret += vo.name + "	" + vo.avtime + "	" + vo.count + "	" + vo.alltime + "	" + vo.maxtime;
				ret2 += vo.name + "		" + " avtime:" + vo.avtime + "	count:" + vo.count + "	alltime:" + vo.alltime + "	maxtime:" + vo.maxtime;
				ret += "\n";
				ret2 += "\n";
			}
			Clipboard.generalClipboard.setData( ClipboardFormats.TEXT_FORMAT, ret );
			return ret2;
		}
		
		public function getDebbugInfoSend(type:int = 0):String
		{
			var ret:String = ("name	count\n" );
			var ret2:String = "";
			var values:Array = _mapListSend.values();

			values.sort(sortfunc2);
			
			for (var i:int = 0; i < values.length; i++)
			{
				var vo:RecordVo = values[i];
				ret += vo.name + "	" + vo.count;
				ret2 += vo.name + "		" + "	count:" + vo.count;
				ret += "\n";
				ret2 += "\n";
			}
			
			Clipboard.generalClipboard.setData( ClipboardFormats.TEXT_FORMAT, ret );
			return ret2;
		}
		
		private function sortfunc1(a:RecordVo, b:RecordVo):int
		{
			if (a.avtime > b.avtime)
				return -1;
			else if (a.avtime < b.avtime)
				return 1;
			
			return 0;
		}
		
		private function sortfunc2(a:RecordVo, b:RecordVo):int
		{
			if (a.count > b.count)
				return -1;
			else if (a.count < b.count)
				return 1;
			
			return 0;
		}
		
		private function sortfunc3(a:RecordVo, b:RecordVo):int
		{
			if (a.alltime > b.alltime)
				return -1;
			else if (a.alltime < b.alltime)
				return 1;
			
			return 0;
		}
		
		private function sortfunc4(a:RecordVo, b:RecordVo):int
		{
			if (a.maxtime > b.maxtime)
				return -1;
			else if (a.maxtime < b.maxtime)
				return 1;
			
			return 0;
		}
	}
}

internal class RecordVo
{
	public var count:int;
	public var name:String;
	public var alltime:int;
	public var avtime:int;
	public var maxtime:int;
}