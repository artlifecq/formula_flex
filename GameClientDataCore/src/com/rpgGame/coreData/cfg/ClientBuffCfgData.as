package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.ClientBuff;
	import com.rpgGame.coreData.clientConfig.HintTypeSetInfo;
	
	import flash.utils.ByteArray;
	
	import org.client.mainCore.ds.HashMap;

	public class ClientBuffCfgData
	{
		public function ClientBuffCfgData()
		{
		}
		public static var buffHashMap : HashMap;
		public static function setUpHintTypeSet(byte:ByteArray):void
		{
			buffHashMap = new HashMap();
			var arr:Array = byte.readObject();
			for each(var hintset:ClientBuff in arr)
			{
				var key : int = hintset.value;
				hintset.value = int.MAX_VALUE - 10000 + key;
				buffHashMap.add(hintset.key,hintset);
			}
		}
		
		public static function getBuffByKey(key:String):ClientBuff
		{
			return buffHashMap.getValue(key);
		}
	}
}