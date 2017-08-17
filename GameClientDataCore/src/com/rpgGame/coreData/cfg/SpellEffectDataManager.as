package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.Q_SpellEffect;
	
	import flash.utils.ByteArray;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 *
	 * 技能效果数据管理器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-24 上午10:30:12
	 *
	 */
	public class SpellEffectDataManager
	{
		public function SpellEffectDataManager()
		{
		}

		private static var _map : HashMap = new HashMap();

		public static function setConfig(data : ByteArray) : void
		{
			var arr:Array = data.readObject();
			if(!arr)
				return;
			for each (var dataProto : Q_SpellEffect in arr)
			{
				addData(dataProto);
			}
		}

		public static function addData(dataProto : Q_SpellEffect) : void
		{
			_map.add(dataProto.id, dataProto);
		}

		public static function getData(id : uint) : Q_SpellEffect
		{
			return _map.getValue(id);
		}
	}
}
