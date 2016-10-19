package com.rpgGame.coreData.info.map.map2d
{
	import flash.utils.ByteArray;

	public dynamic final class MapData
	{
		public var numBlocksX:uint = 200;
		public var numBlocksY:uint = 140;
		
		public function mergeFrom(byteArr:ByteArray,mapID:uint):void
		{
			if(mapID == 6)
			{
				numBlocksX = 200;
				numBlocksY = 140;
			}
			else if(mapID == 8)
			{
				numBlocksX = 740;
				numBlocksY = 560;
			}
			return;
		}
	}
}
