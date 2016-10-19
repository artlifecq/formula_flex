package com.rpgGame.coreData.cfg
{
	import app.message.AnimationConfig;
	import app.message.AnimationProto;

	import org.client.mainCore.ds.HashMap;

	/**
	 *
	 * 动画数据管理器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-24 上午10:30:12
	 *
	 */
	public class AnimationDataManager
	{
		public function AnimationDataManager()
		{
		}

		private static var _map : HashMap = new HashMap();

		public static function setConfig(cfg : AnimationConfig) : void
		{
			if(!cfg)
				return;
			for each (var dataProto : AnimationProto in cfg.animations)
			{
				addData(dataProto);
			}
		}

		public static function addData(dataProto : AnimationProto) : void
		{
			_map.add(dataProto.id, dataProto);
		}

		public static function getData(id : int) : AnimationProto
		{
			return _map.getValue(id) as AnimationProto;
		}
	}
}
