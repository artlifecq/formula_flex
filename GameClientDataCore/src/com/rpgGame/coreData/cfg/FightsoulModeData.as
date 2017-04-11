package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.Q_fightsoul;
	import com.rpgGame.coreData.clientConfig.Q_fightsoul_mode;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	public class FightsoulModeData
	{	
		private static var _datas:Dictionary;
		public static function setConfig( data:ByteArray ):void
		{
			_datas = new Dictionary();
			var arr : Array = data.readObject();
			for each(var info : Q_fightsoul_mode in arr) {
				_datas[info.q_id] = info;
			}
		}
		public static function getModeInfoById(id:int):Q_fightsoul_mode
		{
			return _datas[id];
		}
	}
}


