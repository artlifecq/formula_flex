package com.rpgGame.coreData.cfg
{
	import app.message.SpellEffectConfig;
	import app.message.SpellEffectProto;
	
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

		public static function setConfig(cfg : SpellEffectConfig) : void
		{
			if(!cfg)
				return;
			for each (var dataProto : SpellEffectProto in cfg.spellEffects)
			{
				addData(dataProto);
			}
		}

		public static function addData(dataProto : SpellEffectProto) : void
		{
			_map.add(dataProto.id, dataProto);
		}

		public static function getData(id : uint) : SpellEffectProto
		{
			return _map.getValue(id);
		}
	}
}
