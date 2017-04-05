package com.rpgGame.appModule.maps
{
	public class BigMapsData
	{
		/**当前大地图显示的对应的地图ID*/
		public static var currentMapId:int=-1;
		/**大地图是否加载成功*/
		public static var isMapLoadComplete:Boolean=false;
		
		public static var scaleMapX:Number=0;
		public static var scaleMapY:Number=0;
		//public static var mapsRoleData:Vector.<BigMapIocnDataMode>=new Vector.<BigMapIocnDataMode>;
		
		/**npc数据保存*/
		public static var mapsNpcData:Vector.<BigMapIocnDataMode>=new Vector.<BigMapIocnDataMode>;
		/**怪物数据保存*/
		public static var mapsMonsterData:Vector.<BigMapIocnDataMode>=new Vector.<BigMapIocnDataMode>;
		/**传送数据保存*/
		public static var mapsThansData:Vector.<BigMapIocnDataMode>=new Vector.<BigMapIocnDataMode>;
		
		
		
		
		
		
		
		
		public function BigMapsData()
		{
		}
	}
}