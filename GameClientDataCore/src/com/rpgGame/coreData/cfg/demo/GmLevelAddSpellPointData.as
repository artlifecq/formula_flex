package com.rpgGame.coreData.cfg.demo
{
	import com.rpgGame.coreData.clientConfig.GmLevelAddSpellPoint;

	import flash.utils.ByteArray;

	import org.client.mainCore.ds.HashMap;

	/**
	 *
	 * GM等级增加技能点配置数据
	 * @author L.L.M.Sunny
	 * 创建时间：2015-12-8 下午9:25:12
	 *
	 */
	public class GmLevelAddSpellPointData
	{
		public function GmLevelAddSpellPointData()
		{
		}

		private static var _map : HashMap;

		public static function setup(data : ByteArray) : void
		{
			var arr : Array = data.readObject();
			_map = new HashMap();
			for each (var info : GmLevelAddSpellPoint in arr)
			{
				_map.add(info.level, info);
			}
		}

		public static function getInfo(level : int) : GmLevelAddSpellPoint
		{
			return _map.getValue(level);
		}
	}
}
