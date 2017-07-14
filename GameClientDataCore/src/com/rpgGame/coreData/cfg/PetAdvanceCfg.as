package  com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.Q_girl_advance;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	public class PetAdvanceCfg
	{
		public function PetAdvanceCfg()
		{
		}
		private static var _dataDic:Dictionary;
		private static var _dataArr:Array;
		public static function setup( data:ByteArray ):void
		{
			_dataDic = new Dictionary();
			
			_dataArr = data.readObject();
			
			for each(var info :Q_girl_advance in _dataArr) {
				_dataDic[info.q_id] = info;
			}
		}
		public static function getPet(id:int,level:int):Q_girl_advance
		{
			return _dataDic[id+"_"+level];
		}


	}
}