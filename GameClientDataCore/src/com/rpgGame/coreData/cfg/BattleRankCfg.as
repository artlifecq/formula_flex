package  com.rpgGame.coreData.cfg
{

	
	import com.rpgGame.coreData.clientConfig.Q_battle_rank;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	public class BattleRankCfg
	{
		public function BattleRankCfg()
		{
		}
		private static var _dataDic:Dictionary;
		private static var _dataArr:Array;
		public static function setup( data:ByteArray ):void
		{
			_dataDic = new Dictionary();
			
			_dataArr = data.readObject();
			
			for each(var info : Q_battle_rank in _dataArr) {
				_dataDic[info.q_subrank_id] = info;
			}
		}
		public static function getRank(id:int):Q_battle_rank
		{
			return _dataDic[id];
		}
		public static function getConfigsByMainRank(rank:int):Array
		{
			var ret:Array=[];
			var len:int=_dataArr.length;
			for (var i:int = 0; i < len; i++) 
			{
				if (_dataArr[i].q_rank==rank) 
				{
					ret.push(_dataArr[i]);
				}
			}
			return ret;
		}
		public static function get dataArr():Array
		{
			return _dataArr;
		}

	}
}