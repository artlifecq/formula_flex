package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.HintTypeSetInfo;
	
	import flash.utils.ByteArray;
	
	import org.client.mainCore.ds.HashMap;

	public class HintCfgData
	{
		public function HintCfgData()
		{
		}
		public static var hintTypeSetHashMap : HashMap;
		public static function setUpHintTypeSet(byte:ByteArray):void
		{
			hintTypeSetHashMap = new HashMap();
			var arr:Array = byte.readObject();
			for each(var hintset:HintTypeSetInfo in arr)
			{
				hintTypeSetHashMap.add(hintset.type,hintset);
			}
		}
		
		public static function getHintTypeSet(noticeType:int):HintTypeSetInfo
		{
			return hintTypeSetHashMap.getValue(noticeType);
		}
	}
}