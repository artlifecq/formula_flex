package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.Q_SpellAnimation;
	
	import flash.utils.ByteArray;
	
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

		public static function setConfig(data : ByteArray) : void
		{
			var arr:Array = data.readObject();
			if(!arr)
				return;
			for each (var dataProto : Q_SpellAnimation in arr)
			{
				addData(dataProto);
			}
		}

		public static function addData(dataProto : Q_SpellAnimation) : void
		{
			_map.add(dataProto.id, dataProto);
		}

		public static function getData(id : int) : Q_SpellAnimation
		{
			return _map.getValue(id) as Q_SpellAnimation;
		}
	}
}
