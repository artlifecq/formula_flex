package  com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.Q_girl_pet;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	public class PetCfg
	{
		public function PetCfg()
		{
		}
		private static var _dataDic:Dictionary;
		private static var _dataArr:Array;
		public static function setup( data:ByteArray ):void
		{
			_dataDic = new Dictionary();
			
			_dataArr = data.readObject();
			
			for each(var info :Q_girl_pet in _dataArr) {
				_dataDic[info.q_id] = info;
			}
		}
		public static function getPet(id:int):Q_girl_pet
		{
			return _dataDic[id];
		}

		public static function get dataArr():Array
		{
			return _dataArr;
		}


	}
}