package  com.rpgGame.coreData.cfg
{

	

	
	import com.rpgGame.coreData.clientConfig.Q_source;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	public class SourceGetCfg
	{
		public function SourceGetCfg()
		{
		}
		private static var _dataDic:Dictionary;
		private static var _dataArr:Array;
		public static function setup( data:ByteArray ):void
		{
			_dataDic = new Dictionary();
			
			_dataArr = data.readObject();
			
			for each(var info : Q_source in _dataArr) {
				_dataDic[info.q_itemid] = info;
			}
		}
		public static function getSource(id:int):Q_source
		{
			return _dataDic[id];
		}

		public static function get dataArr():Array
		{
			return _dataArr;
		}

	}
}