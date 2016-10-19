package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.info.BaZhenTuSpellInfo;
	
	import app.message.BaZhenTuDungeonProto;
	import app.message.BaZhenTuDungeonProto.BaZhenTuMonsterSpellProto;
	
	import org.client.mainCore.ds.HashMap;

	public class BaZhenTuCfgData
	{
		public static var expMultipleStartInToday:Number;// 副本活动开启时间(在当天)
		public static var expMultipleEndInToday:Number;// 副本活动结束时间(在当天)
		public static var expMultiple:int;//经验加成倍率，百分比，客户端除以100
		public static var maxWaveCount:int;// 总共的波数
		public static var canEnterTimesPerDay:int;// 每天能够进入的次数
		public static var waveMonsterCount:int;//每一波的怪物数量
		private static var _spellHash:HashMap = new HashMap();
		public function BaZhenTuCfgData()
		{
		}
		public static function setConfig( proto:BaZhenTuDungeonProto ):void
		{
			expMultipleStartInToday = proto.expMultipleStartInToday.toNumber();
			expMultipleEndInToday = proto.expMultipleEndInToday.toNumber();
			expMultiple = proto.expMultiple;
			maxWaveCount = proto.maxWaveCount;
			canEnterTimesPerDay = proto.canEnterTimesPerDay;
			waveMonsterCount = proto.waveMonsterCount;
			var len:int = proto.monsterSpells.length;
			for(var i:int= 0; i<len; i++)
			{
				var spellProto:BaZhenTuMonsterSpellProto = proto.monsterSpells[i];
				var info:BaZhenTuSpellInfo = new BaZhenTuSpellInfo();
				info.setData(spellProto);
				_spellHash.add(info.id,info);
			}
			
		}
		public static function getSpellInfo(key:int):BaZhenTuSpellInfo
		{
			return _spellHash.getValue(key);
		}
	}
}