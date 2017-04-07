package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.Q_fightsoul_path;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	public class FightsoulPathData
	{	
		private static var _sheets:Dictionary;
		private static var _datas:Vector.<Q_fightsoul_path>;
		public static function setConfig( data:ByteArray ):void
		{
			_sheets=new Dictionary();
			_datas = new Vector.<Q_fightsoul_path>();
			var arr : Array = data.readObject();
			for each(var info : Q_fightsoul_path in arr) {
				_sheets[info.q_id] = info;
				_datas.push(info);
			}
		}
		public static function getInfobyId(winid:int):Q_fightsoul_path
		{
			if(_sheets[winid]==null)
				return null;
			return _sheets[winid];
		}
		
		public static function get datas():Vector.<Q_fightsoul_path>
		{
			return _datas;
		}
	}
}

