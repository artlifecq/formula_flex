package com.rpgGame.coreData.cfg.cheats
{

	
	import com.rpgGame.coreData.clientConfig.Q_cheats_node;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	public class CheatsNodeCfg
	{
		public function CheatsNodeCfg()
		{
		}
		private static var _dataDic:Dictionary;
		private static var _dataArr:Array;
		public static function setup( data:ByteArray ):void
		{
			_dataDic = new Dictionary();
			
			_dataArr = data.readObject();
			
			for each(var info : Q_cheats_node in _dataArr) {
				_dataDic[info.q_node_id] = info;
			}
		}
		public static function getCheatsNode(id:String):Q_cheats_node
		{
			return _dataDic[id];
		}
		
		public static function get dataArr():Array
		{
			return _dataArr;
		}
	}
}