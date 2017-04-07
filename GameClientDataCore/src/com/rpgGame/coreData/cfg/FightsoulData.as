package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.Q_fightsoul;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	public class FightsoulData
	{	
		private static var _sheets:Dictionary;
		private static var _datas:Vector.<Q_fightsoul>;
		private static var _qualitys:Dictionary;
		private static var _maxQuality:int = 0;
		public static function setConfig( data:ByteArray ):void
		{
			_sheets=new Dictionary();
			_qualitys = new Dictionary();
			_datas = new Vector.<Q_fightsoul>();
			var arr : Array = data.readObject();
			for each(var info : Q_fightsoul in arr) {
				_sheets[info.q_level] = info;
				_datas.push(info);
				
				if(_maxQuality < info.q_quality)
					_maxQuality = info.q_quality;
				
				var lastq:Q_fightsoul = _qualitys[info.q_quality] as Q_fightsoul;
				if(lastq==null)
				{
					_qualitys[info.q_quality] = info;
				}else {
					if(lastq.q_level>info.q_level)
						_qualitys[info.q_quality] = info;
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
		
		public static function getInfoByQuality(quality:int):Q_fightsoul
		{
			if(_qualitys[quality]==null)
				return null;
			return _qualitys[quality];
		}
		
		public static function get maxQuality():int
		{
			return _maxQuality;
		}
	}
}


