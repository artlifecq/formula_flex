package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.Q_die;
	
	import flash.utils.ByteArray;

	public class DieCfgData
	{
		public function DieCfgData()
		{
		}
		
		private static var _dieOpenList:Vector.<Q_die>;
		
		public static function setup( data:ByteArray ):void
		{
			_dieOpenList=new Vector.<Q_die>();
			var arr : Array = data.readObject();
			for each(var info : Q_die in arr) {
				_dieOpenList.push(info);
			}
		}
		
		public static function get allOpenList():Vector.<Q_die>
		{
			return _dieOpenList;
		}
	}
}