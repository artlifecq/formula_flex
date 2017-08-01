package  com.rpgGame.coreData.cfg
{
	
	import com.rpgGame.coreData.clientConfig.Q_shuxing;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	public class AttributeCfg
	{
		public function AttributeCfg()
		{
		}
		private static var _dataDic:Dictionary;
		private static var _dataArr:Array;
		public static function setup( data:ByteArray ):void
		{
			_dataDic = new Dictionary();
			
			_dataArr = data.readObject();
			
			for each(var info :Q_shuxing in _dataArr) {
				_dataDic[info.q_id] = info;
			}
		}
		public static function getAttr(id:int):Q_shuxing
		{
			return _dataDic[id];
		}
		public static function getAttrName(id:int):String
		{
			var qShu:Q_shuxing=getAttr(id);
			if (qShu) 
			{
				return qShu.q_att_name;
			}
			return "";
		}
		public static function getAttrIconUrl(id:int):String
		{
			var qShu:Q_shuxing=getAttr(id);
			if (qShu) 
			{
				return qShu.q_resource_icon;
			}
			return "";
		}
		public static function getAttrNameUrl(id:int):String
		{
			var qShu:Q_shuxing=getAttr(id);
			if (qShu) 
			{
				return qShu.q_resource_name;
			}
			return "";
		}
	}
}