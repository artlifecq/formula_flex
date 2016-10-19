package com.client.loader
{
	import flash.display.Sprite;
	
	/**
	 * alchemy包装器，用于loader调用并加载客户端 
	 * @author Carver
	 */	
	public class PreLoader extends Sprite
	{
		/**
		 * 返回alchemy加载器对象，包含一个加载接口:
		 * <li>param1 资源路径数组</li>
		 * <li>param2 主程序参数</li>
		 * <li>param3 回调函数所在的对象</li>
		 * <li>param4 完成回调</li>
		 * <li>param5 进度回调</li>
		 * <li>loader.load_res( [ "res1.o", "res2.o" ], param, this, onComp, onProg, onError );</li>
		 * @return 加载器对象
		 * @author masefee
		 * 2012-6-8
		 */		
		public function get loader():Object
		{
			return PreLoadLibrary.get().library;
		}
	}
}