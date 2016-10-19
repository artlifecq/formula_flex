package com.game.engine2D.utils
{
	/**
	 * 标准文件头
	 * @author guoqing.wen
	 * 
	 */
	public class FileHead
	{
		public static const HEAD_LENGTH:int = 8;
		public static const HEAD_FLAG:int = 0x32db;
		private var _head:int;
		private var _compressType:uint;
		private var _version:uint;
		
		public function FileHead()
		{
		}

		public function get head():int
		{
			return _head;
		}

		public function set head(value:int):void
		{
			_head = value;
		}

		public function get compressType():uint
		{
			return _compressType;
		}

		public function set compressType(value:uint):void
		{
			_compressType = value;
		}

		public function get version():uint
		{
			return _version;
		}

		public function set version(value:uint):void
		{
			_version = value;
		}


	}
}