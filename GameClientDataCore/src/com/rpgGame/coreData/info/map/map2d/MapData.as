package com.rpgGame.coreData.info.map.map2d
{
	import flash.utils.ByteArray;

	public class MapData
	{
		public var numBlocksX:uint = 200;
		public var numBlocksY:uint = 140;
        public var ID : int = -1;
        
        public function MapData(mapID : int) {
            this.ID = mapID;
        }
		
		public function mergeFrom(byteArr:ByteArray):void
		{
            this.numBlocksX = byteArr.readInt();
            this.numBlocksY = byteArr.readInt();
		}
	}
}
