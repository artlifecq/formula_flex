package com.client.loader
{
	import cmodule.PreLoader.CLibInit;

	public class PreLoadLibrary
	{
		/** alchemy库包装器单例对象 **/
		private static var _libInst:PreLoadLibrary;
		
		/** alchemy初始化对象 **/
		private var _preload:CLibInit;
		/** alchemy库对象 **/
		private var _library:Object;

		/**
		 * 获取alchemy库单例对象
		 * @return 库单例
		 */		
		public static function get():PreLoadLibrary
		{
			return ( _libInst == null ) ? ( _libInst = new PreLoadLibrary() ) : _libInst;
		}
		
		/**
		 * 构造函数 
		 */		
		public function PreLoadLibrary()
		{
			_preload = new CLibInit();
			_library = _preload.init();
		}
		
		/**
		 * 获取alchemy初始化对象 
		 */		
		public function get preload():CLibInit
		{
			return _preload;
		}
		
		/**
		 * 获取alchemy库对象 
		 */		
		public function get library():Object
		{
			return _library;
		}
	}
}
