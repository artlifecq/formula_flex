package com.rpgGame.coreData.cfg.crown
{
	import com.rpgGame.coreData.clientConfig.CrownNeiZhenInfo;
	import com.rpgGame.coreData.clientConfig.CrownPageInfo;
	
	import flash.utils.ByteArray;
	
	import org.client.mainCore.ds.HashMap;

	public class CrownPanelPagesCfgData
	{
		public function CrownPanelPagesCfgData()
		{
		}
		private static var map : HashMap;
		private static var pageMap : HashMap;
		public static function setup(byte : ByteArray):void
		{
			var array : Array = byte.readObject();
			map= new HashMap();
			pageMap = new HashMap();
			for each(var page : CrownPageInfo in array)
			{
				if(page.id == -1)
				{
					setPageMap(page.value);
					continue;
				}
				map.add(page.id,page);
			}
		}
		private static function setPageMap(str:String):void
		{
			var pages : Array = str.split("|");
			var temp : Array;
			pageMap.clear();
			for each(var page:String in pages)
			{
				temp = page.split("=");
				if(!temp || temp.length != 2)
					continue;
				pageMap.add(temp[0],temp[1]);
			}
		}
		
		public static function getPageInfoByPos(pos:int):CrownPageInfo
		{
			return map.getValue(pos);
		}
		
		public static function getPagesTabBar(pos:int):Array
		{
			var page : CrownPageInfo = map.getValue(pos);
			var temp : Array = [];
			temp.push(page.value);
			for each(var key : String in page.pages)
			{
				if(pageMap.getValue(key)!= null && key != "")
					temp.push(pageMap.getValue(key));
			}
			return temp;
		}
	}
}