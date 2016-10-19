package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.HintInfo;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	/**
	 * 所有提示语配置
	 * @author luguozheng
	 * 
	 */	
	public class HintConfig
	{
		private static var _dataDic:Dictionary;
		
		public static function setup( data:ByteArray ):void
		{
			_dataDic = new Dictionary();
			
			var arr : Array = data.readObject();
			for each (var info : HintInfo in arr)
			{
				_dataDic[info.key] = info;
			}
		}
		
		public static function getHintInfo( id:String) : HintInfo
		{
			return _dataDic[id];
		}
		
	}
}