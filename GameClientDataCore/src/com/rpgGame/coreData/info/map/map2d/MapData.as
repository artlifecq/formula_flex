package com.rpgGame.coreData.info.map.map2d
{
	import flash.utils.ByteArray;

	public class MapData
	{
		public var width:uint = 200;
		public var height:uint = 140;
        
        public var thumbnailWidth : uint = 0;
        public var thumbnailHeight : uint = 0;
        
        public var ID : int = -1;
        
        public function MapData(mapID : int) {
            this.ID = mapID;
        }
		
		public function mergeFrom(byteArr:ByteArray):void
		{
            this.width = byteArr.readInt();
            this.height = byteArr.readInt();
            this.thumbnailWidth = byteArr.readInt();
            this.thumbnailHeight = byteArr.readInt();
		}
	}
}
