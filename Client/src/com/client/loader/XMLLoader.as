package com.client.loader
{
	import com.client.events.XMLEvent;
	import com.gameClient.log.GameLog;
	
	import flash.errors.IOError;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLRequest;
	import flash.net.URLStream;
	import flash.utils.ByteArray;
	
	/**
	 *  
	 * @author carver
	 * 
	 */	
	public class XMLLoader extends EventDispatcher
	{
		private var _xmlloader:URLStream;
		private var _isCompress:Boolean;
		private var _isLoading:Boolean = false;
		private var _list:Vector.<XMLFileInfo> = new Vector.<XMLFileInfo>;
		private var _info:XMLFileInfo;
		private var _decode:Function;
		
		public function XMLLoader(decode:Function = null)
		{
			_decode = decode;
			
			_xmlloader = new URLStream();
			_xmlloader.addEventListener(Event.COMPLETE, onComplete);
			_xmlloader.addEventListener(Event.OPEN,onOpen);
			_xmlloader.addEventListener(ProgressEvent.PROGRESS,onProgress);
			_xmlloader.addEventListener(IOErrorEvent.IO_ERROR, onIoError);
			_xmlloader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,onSecurityError);
		}
		
		/**
		 * 
		 * @param url
		 * @param isCompress zlib
		 * 
		 */		
		public function load(info:XMLFileInfo):void
		{
			_list.push(info);
			_isCompress = info.isCompress;
			if(!_isLoading)
			{
				_info = _list.shift();
				var path:String = _info.path;
				_xmlloader.load(new URLRequest(path));
			}
		}
		public function close():void
		{
			if(_xmlloader.connected)
			{
				_xmlloader.close();
			}
		}
		
		public function loadList(list:Vector.<XMLFileInfo>):void
		{
			for each(var info:XMLFileInfo in list)
			{
				_list.push(info);
			}
			if(!_isLoading)
			{
				_info = _list.shift();
				var path:String = _info.path;
				_xmlloader.load(new URLRequest(path));
			}
		}
		
		public function destroy():void
		{
			close();
			_xmlloader.removeEventListener(Event.COMPLETE, onComplete);
			_xmlloader.removeEventListener(Event.OPEN,onOpen);
			_xmlloader.removeEventListener(ProgressEvent.PROGRESS,onProgress);
			_xmlloader.removeEventListener(IOErrorEvent.IO_ERROR, onIoError);
			_xmlloader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,onSecurityError);
			_xmlloader = null;
		}
		
		private function onOpen(e:Event):void
		{ 
			_isLoading = true;
			dispatchEvent(e);
		}
		private function onComplete(e:Event):void
		{
			_isLoading = false;
			var data:ByteArray = new ByteArray();
			_xmlloader.readBytes(data);
			if(_decode != null)
			{
				data.uncompress();
				data = _decode(data);
			}
			_info.data = XML(data.readUTFBytes(data.bytesAvailable));
			GameLog.addShow(_info.data.toXMLString());
			if(_info.completeFun != null)
			{
				_info.completeFun(_info);
			}
			dispatchEvent(new XMLEvent(XMLEvent.COMPLETE,_info));
			//
			if(_list.length)
			{
				_info = _list.shift();
				_xmlloader.load(new URLRequest(_info.path));
			}
			else
			{
				dispatchEvent(new XMLEvent(XMLEvent.ALL_COMPLETE));
			}
		}
		private function onProgress(e:ProgressEvent):void
		{
			dispatchEvent(e);
		}
		private function onIoError(e:IOErrorEvent):void
		{
			dispatchEvent(e);
			GameLog.throwError(new IOError(e.text));
		}
		private function onSecurityError(e:SecurityErrorEvent):void
		{
			dispatchEvent(e);
			GameLog.throwError(new SecurityError(e.text));
		}
	}
}