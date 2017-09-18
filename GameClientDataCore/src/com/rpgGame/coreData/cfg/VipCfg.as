package  com.rpgGame.coreData.cfg
{
	
	
	
	
	
	
	import com.gameClient.utils.JSONUtil;
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
		
		public static function getBuQianNum(lv:int):int
		{
			var cfg:Q_vip=_dataDic[lv];
			var arr:Array=JSONUtil.decode(cfg.q_sign_times);
			return arr[0];
		}
		
		public static function getTIQianNum(lv:int):int
		{
			var cfg:Q_vip=_dataDic[lv];
			var arr:Array=JSONUtil.decode(cfg.q_sign_times);
			return arr[1];
		}
	}
}