package com.rpgGame.coreData.cfg.sound
{
	import com.rpgGame.coreData.clientConfig.GameSoundInfo;
	
	import flash.utils.ByteArray;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 * 声音配置信息
	 * @author Carver
	 */
	public class GameSoundCfgData
	{
		private static var _map:HashMap;
		
		public static function setup(data:ByteArray):void
		{
			var arr:Array =  data.readObject();
			_map = new HashMap();
			for each(var info:GameSoundInfo in arr)
			{
				_map.add(info.id,info);
			}
		}
		
		public static function getInfo(type:int, id:int):GameSoundInfo
		{
			return _map.getValue(type+"_"+id);
		}
		
		public static function getSoundName(type:int, id:int):String
		{
			var info:GameSoundInfo = GameSoundCfgData.getInfo(type, id);
			if(!info)
			{
				return null;
			}
			var nameArr:Array = info.soundNames.split(";");
			var name:String = nameArr[uint(nameArr.length*Math.random())];
			return name;
		}
	}
}