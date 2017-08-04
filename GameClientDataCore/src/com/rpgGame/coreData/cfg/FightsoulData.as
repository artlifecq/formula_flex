package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.Q_fightsoul;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	public class FightsoulData
	{	
		private static var _sheets:Dictionary;
		private static var _datas:Vector.<Q_fightsoul>;
		private static var _modes:Dictionary;
		private static var _maxMode:int = 0;
		
		public static var  FightSoulMaxLevel:int = 0;
		
		public static function setConfig( data:ByteArray ):void
		{
			_sheets=new Dictionary();
			_modes = new Dictionary();
			_datas = new Vector.<Q_fightsoul>();
			var arr : Array = data.readObject();
			for each(var info : Q_fightsoul in arr) {
				_sheets[info.q_level] = info;
				_datas.push(info);
				FightSoulMaxLevel=FightSoulMaxLevel<info.q_level?info.q_level:FightSoulMaxLevel;
				
				if(_maxMode < info.q_mode)
					_maxMode = info.q_mode;
				
				var lastq:Q_fightsoul = _modes[info.q_mode] as Q_fightsoul;
				if(lastq==null)
				{
					_modes[info.q_mode] = info;
				}else {
					if(lastq.q_level>info.q_level)
						_modes[info.q_mode] = info;
				}
			}
		}
		public static function getInfobyId(id:int):Q_fightsoul
		{
			if(_sheets[id]==null)
				return null;
			return _sheets[id];
		}
		
		public static function get datas():Vector.<Q_fightsoul>
		{
			return _datas;
		}
		
		public static function getInfoByMode(mode:int):Q_fightsoul
		{
			if(_modes[mode]==null)
				return null;
			return _modes[mode];
		}
		
		public static function get allModes():Dictionary
		{
			return _modes;
		}
		
		public static function get maxMode():int
		{
			return _maxMode;
		}
	}
}


