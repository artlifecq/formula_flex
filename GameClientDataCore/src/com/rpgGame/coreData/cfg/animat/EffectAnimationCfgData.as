package com.rpgGame.coreData.cfg.animat
{
	import com.rpgGame.coreData.clientConfig.EffectAnimation;

	import flash.utils.ByteArray;

	import org.client.mainCore.ds.HashMap;

	/**
	 *
	 * 特效动画配置数据
	 * @author L.L.M.Sunny
	 * 创建时间：2015-12-15 上午10:25:12
	 *
	 */
	public class EffectAnimationCfgData
	{
		private static var _map : HashMap;

		public static function setup(data : ByteArray) : void
		{
			var arr : Array = data.readObject();
			_map = new HashMap();
			for each (var info : EffectAnimation in arr)
			{
				_map.add(info.res, info);
			}
		}

		public static function getInfo(res : String) : EffectAnimation
		{
			return _map.getValue(res);
		}

		public function EffectAnimationCfgData()
		{
		}
	}
}
