package  com.rpgGame.coreData.cfg
{

	

	
	
	
	import com.rpgGame.coreData.clientConfig.Q_vip;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	public class VipCfg
	{
		public function VipCfg()
		{
		}
		private static var _dataDic:Dictionary;
		private static var _dataArr:Array;
		public static function setup( data:ByteArray ):void
		{
			_dataDic = new Dictionary();
			
			_dataArr = data.readObject();
			
			for each(var info :Q_vip in _dataArr) {
				_dataDic[info.q_vipid] = info;
			}
		}
		public static function getVip(id:int):Q_vip
		{
			return _dataDic[id];
		}


	}
}