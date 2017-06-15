package  com.rpgGame.coreData.cfg
{

	

	
	import com.rpgGame.coreData.clientConfig.Q_nine_tower;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	public class NineTowerCfg
	{
		public function NineTowerCfg()
		{
		}
		private static var _dataDic:Dictionary;
		private static var _dataArr:Array;
		public static function setup( data:ByteArray ):void
		{
			_dataDic = new Dictionary();
			
			_dataArr = data.readObject();
			
			for each(var info :Q_nine_tower in _dataArr) {
				_dataDic[info.q_tower_id] = info;
			}
		}
		public static function getTower(id:int):Q_nine_tower
		{
			return _dataDic[id];
		}


	}
}