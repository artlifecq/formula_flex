package com.editor.utils
{
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.net.URLRequest;
	import flash.net.URLStream;
	import flash.utils.ByteArray;

	/**
	 *
	 * 文件下载器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-11-24 上午10:30:12
	 *
	 */
	public class FileLoader
	{
		private var _filePath : String;
		private var _urlReq : URLRequest;
		private var _urlStream : URLStream;
		private var _fileData : ByteArray;
		private var _onComplete : Function;

		public function FileLoader()
		{
			_urlStream = new URLStream();
		}

		public function load(url : String, filePath : String, onComplete : Function) : void
		{
			_filePath = filePath;
			_onComplete = onComplete;
			_urlReq = new URLRequest(url);
			_urlStream.addEventListener(Event.COMPLETE, onLoaded);
			_urlStream.addEventListener(IOErrorEvent.IO_ERROR, onError);
			_urlStream.load(_urlReq);
		}

		private function onLoaded(event : Event) : void
		{
			_fileData = new ByteArray();
			_urlStream.readBytes(_fileData, 0, _urlStream.bytesAvailable);

			var file : File = File.applicationStorageDirectory.resolvePath(_filePath);
			var fileStream : FileStream = new FileStream();
			fileStream.addEventListener(Event.CLOSE, fileClosed);
			fileStream.openAsync(file, FileMode.WRITE);
			fileStream.writeBytes(_fileData, 0, _fileData.length);
			fileStream.close();
		}

		private function onError(event : Event) : void
		{
			_urlStream.load(_urlReq);
		}

		private function fileClosed(event : Event) : void
		{
			var file : File = File.applicationStorageDirectory.resolvePath(_filePath);
			if (_onComplete != null)
				_onComplete(file);
		}
	}
}
