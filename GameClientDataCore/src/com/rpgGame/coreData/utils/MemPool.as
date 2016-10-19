package com.rpgGame.coreData.utils
{

	/**
	 * 内存池
	 * @author 童勇军 2015-04-24
	 */	
	public class MemPool
	{
		/** 池包含类型 **/
		private var _cls:Class;
		/** 最大数量 **/
		private var _max:uint = 0;
		/** 释放列表 **/
		private var _freelist:Array = [];
		/** 是否已经检测过 **/
		private var _isChecked:Boolean = false;
		/** 是否有内存池释放接口 **/
		private var _isHaveDispose:Boolean = false;
		
		/**
		 * 构造函数
		 * @param cls
		 */		
		public function MemPool( cls:Class, maxCount:int = 64 )
		{
			_cls = cls;
			_max = maxCount;
		}
		
		/**
		 * 分配一个内存单元
		 * @return 内存单元对象
		 */		
		public function alloc():*
		{
			var ret:* = null;
			if ( _freelist.length == 0 )
			{
				ret = new _cls();
				
				if ( !_isChecked )
					checkHaveDispose( ret );
				
				return ret;
			}
			
			ret = _freelist.pop();
			return ret;
		}
		
		/**
		 * 释放一个内存单元
		 * 释放后请主动设置为null防止重复释放
		 * @param data 单元对象
		 */		
		public function dealloc( data:* ):void
		{
			if ( data is _cls )
			{
				if ( !_isChecked )
					checkHaveDispose( data );
				
				if ( _isHaveDispose )
					data.poolDispose();
				
				if ( _freelist.length > _max )
					return;
				
				_freelist.push( data );
			}
			else
			{
			}
		}
		
		/**
		 * 检测是否包含内存池dispose接口 
		 * @param data 池里的对象
		 */		
		private function checkHaveDispose( data:* ):void
		{
			_isHaveDispose = data.hasOwnProperty( "poolDispose" );
			_isChecked = true;
		}
	}
}