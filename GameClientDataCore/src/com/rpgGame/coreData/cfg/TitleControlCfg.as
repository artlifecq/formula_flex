package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.Q_girl_advance;
	import com.rpgGame.coreData.clientConfig.Q_title_control;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	public class TitleControlCfg
	{
		public function TitleControlCfg()
		{
		}
		private static var _dataDic:Dictionary;
		private static var _dataArr:Array;
		public static function setup( data:ByteArray ):void
		{
			_dataDic = new Dictionary();
			
			_dataArr = data.readObject();
			
			for each(var info :Q_title_control in _dataArr) {
				_dataDic[info.q_id] = info;
			}
		}
		
		public static function getTitle(id:int):Q_title_control
		{
			return _dataDic[id];
		}
		

	}
}