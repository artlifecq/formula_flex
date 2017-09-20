package com.rpgGame.app.manager.map
{
	import com.rpgGame.core.events.MapEvent;
	
	import org.client.mainCore.manager.EventManager;

	public class BigMapsManager
	{
		/**当前大地图显示的对应的地图ID*/
		public static var currentMapId:int=-1;
		/**大地图是否加载成功*/
		public static var isMapLoadComplete:Boolean=false;
		
		public static var scaleMapX:Number=0;
		public static var scaleMapY:Number=0;
		public static var OffsetX:Number=0;
		public static var OffsetY:Number=0;
		//public static var mapsRoleData:Vector.<BigMapIocnDataMode>=new Vector.<BigMapIocnDataMode>;
		
		/**npc数据保存*/
		private static var mapsNpcData:Vector.<BigMapIocnDataMode>=new Vector.<BigMapIocnDataMode>;
		/**怪物数据保存*/
		private static var mapsMonsterData:Vector.<BigMapIocnDataMode>=new Vector.<BigMapIocnDataMode>;
		/**传送数据保存*/
		private static var mapsThansData:Vector.<BigMapIocnDataMode>=new Vector.<BigMapIocnDataMode>;
		/**其它数据保存 不会显示在右侧滚动栏，会显示在地图图标*/
		private static var mapsOtherData:Vector.<BigMapIocnDataMode>=new Vector.<BigMapIocnDataMode>;
		
		
		private static var mapsIconID:int=0;
		private static var mapsIconData:Vector.<BigMapIocnDataMode>=new Vector.<BigMapIocnDataMode>;
		/**
		 *大地图中显示一个图标 
		 * @param type 类型 SceneCharType NPC MONSTER TRANS 会对应显示在右边滚动栏中
		 * @param name 可带颜色
		 * @param x 场景坐标
		 * @param y 场景坐标
		 * @param level
		 * @param show 是否显示在地图图片上与type配合和只显示在滚动栏
		 * @param img 图标路径
		 * @return 图标id 可用此id删除图标
		 * 
		 */		
		public static function showMapsIcon(type:String,name:String,x:Number,y:Number,level:int=0,show:Boolean=true,img:String=""):int
		{
			var id:int=addMapsIcon(type,name,x,y,level,show,img);
			EventManager.dispatchEvent(MapEvent.MAP_ROLEPOS_UPDATE);
			return id;
		}
		
		/**大地图中加入图标数据：不会马上显示，需马上显示请使用  showMapsIcon 方法*/
		public static function addMapsIcon(type:String,name:String,x:Number,y:Number,level:int=0,show:Boolean=true,img:String=""):int
		{
			mapsIconID++;
			var roleMode:BigMapIocnDataMode=new BigMapIocnDataMode(mapsIconID,type,x,y,name,level,show,img);
			mapsIconData.push(roleMode);
			return roleMode.id;
		}
		public static function removeMapsIcon(id:int):void
		{
			for(var i:int=0;i<mapsIconData.length;i++)
			{
				if(mapsIconData[i].id==id)
				{
					mapsIconData.splice(i,1);
				}
			}
			EventManager.dispatchEvent(MapEvent.MAP_ROLEPOS_UPDATE);
			
		}
		public static function getMapsIconList():Vector.<BigMapIocnDataMode>
		{
			return mapsIconData;
		}
		public static function getMapsIconDataByid(id:int):BigMapIocnDataMode
		{
			for(var i:int=0;i<mapsIconData.length;i++)
			{
				if(mapsIconData[i].id==id)
				{
					return mapsIconData[i];
				}
			}
			return null;
		}
		
		
		public static function getMapsIconListByType(type:String):Vector.<BigMapIocnDataMode>
		{
			var iconList:Vector.<BigMapIocnDataMode>=new Vector.<BigMapIocnDataMode>();
			for(var i:int=0;i<mapsIconData.length;i++)
			{
				if(mapsIconData[i].type==type)
				{
					iconList.push(mapsIconData[i]);
				}
			}
			return iconList;
		}
		
		
//		public static function getMapsNpcData():Vector.<BigMapIocnDataMode>
//		{
//			return mapsNpcData;
//		}
//		public static function getMapsMonsterData():Vector.<BigMapIocnDataMode>
//		{
//			return mapsMonsterData;
//		}
//		public static function getMapsThansData():Vector.<BigMapIocnDataMode>
//		{
//			return mapsThansData;
//		}
//		public static function getMapsOtherData():Vector.<BigMapIocnDataMode>
//		{
//			return mapsOtherData;
//		}
//		public static function addMapsNpcIcon(type:String,name:String,x:Number,y:Number,level:int=0,show:Boolean=true):void
//		{
//			var roleMode:BigMapIocnDataMode=new BigMapIocnDataMode();
//			roleMode.type=type;
//			roleMode.name=name;
//			roleMode.level=level;
//			roleMode.show=show;
//			roleMode.x=x;
//			roleMode.y=y;
//			mapsNpcData.push(roleMode);
//		}
//		public static function addMapsMonsterIcon(type:String,name:String,x:Number,y:Number,level:int=0,show:Boolean=true):void
//		{
//			var roleMode:BigMapIocnDataMode=new BigMapIocnDataMode();
//			roleMode.type=type;
//			roleMode.name=name;
//			roleMode.level=level;
//			roleMode.show=show;
//			roleMode.x=x;
//			roleMode.y=y;
//			mapsMonsterData.push(roleMode);
//		}
//		public static function addMapsThansIcon(type:String,name:String,x:Number,y:Number,level:int=0,show:Boolean=true):void
//		{
//			var roleMode:BigMapIocnDataMode=new BigMapIocnDataMode();
//			roleMode.type=type;
//			roleMode.name=name;
//			roleMode.level=level;
//			roleMode.show=show;
//			roleMode.x=x;
//			roleMode.y=y;
//			mapsThansData.push(roleMode);
//		}
//		/**其它数据保存 不会显示在右侧滚动栏，会显示在地图图标*/
//		public static function addMapsOtherIcon(type:String,name:String,x:Number,y:Number,level:int=0,show:Boolean=true):void
//		{
//			var roleMode:BigMapIocnDataMode=new BigMapIocnDataMode();
//			roleMode.type=type;
//			roleMode.name=name;
//			roleMode.level=level;
//			roleMode.show=show;
//			roleMode.x=x;
//			roleMode.y=y;
//			mapsOtherData.push(roleMode);
//		}
		
		public static function clearMapsData():void
		{
			mapsNpcData.length=0;
			mapsThansData.length=0;
			mapsMonsterData.length=0;
			mapsIconData.length=0;
			mapsIconID=0;
		}
		
		/*public static function getMapIocnDataMode(type:String,id:int):BigMapIocnDataMode
		{
			
		}*/
		public function BigMapsManager()
		{
		}
	}
}