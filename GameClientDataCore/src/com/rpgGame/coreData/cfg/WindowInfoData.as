package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.Q_windowInfo;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	public class WindowInfoData
	{
		public function WindowInfoData()
		{
		}
		
		private static var _sheets:Dictionary;
		private static var _datas:Vector.<Q_windowInfo>;
		public static function setConfig( data:ByteArray ):void
		{
			_sheets=new Dictionary();
			_datas = new Vector.<Q_windowInfo>();
			var arr : Array = data.readObject();
			for each(var info : Q_windowInfo in arr) {
				_sheets[info.q_ID] = info;
				_datas.push(info);
			}
		}
		public static function getInfobyId(winid:int):Q_windowInfo
		{
			if(_sheets[winid]==null)
				return null;
			return _sheets[winid];
		}
		
		public static function get datas():Vector.<Q_windowInfo>
		{
			return _datas;
		}
	}
}

