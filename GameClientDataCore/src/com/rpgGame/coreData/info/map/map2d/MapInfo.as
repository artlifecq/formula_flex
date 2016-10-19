package  com.rpgGame.coreData.info.map.map2d
{
	import com.game.engine2D.config.MapConfig;
	import com.rpgGame.coreData.info.map.map2d.staticMapData.IMapData;

	/**
	 * 地图数据模型,跟策划配置对应
	 * @author carver
	 * 
	 */	
	public class MapInfo
	{
		/**
		 * 地图ID 
		 */	
		public var id:int;
		/**
		 * 地图名字
		 */		
		public var name:String;
		/**
		 * 当前地图所在线路
		 */	
		public var lineID:uint;
		
		//-------------------------------风云相关--------------------------------------
		/**------------------场景配置文件数据(from MiscModule)------------------*/
		
		/**
		 * 地图静态数据接口，所有普通场景及副本地图数据都实现此接口
		 * 说明：1.如果需要获取公共静态属性(参照BaseMapData),则直接获取,如:Mgr.mapMgr.curMapVo.statData.sceneId;
		 *     2.如果需要获取特有属性,则需转换为相应的类,如：
		 *     var curStroyDungeonData:StoryDungeonData = Mgr.mapMgr.curMapVo.statData as StoryDungeonData;
		 curStroyDungeonData.requiredLevel//剧情副本地图进入所需等级
		 */
		public var mapData:IMapData;//静态属性
		//
		public var mapConfig:MapConfig;//引擎地图配置信息。
		public var mapDataInfo:MapDataInfo;//地图资源信息
//		/**<地图 区域信息  如：安全区，战争迷雾区，双倍经验区等等>*/
//		public var mapAreaResInfo:MapAreaResInfo;
		
		/**-------------------线数据(from SceneModule)------------------*/
		public var totalLineCount:int = -1;//总线数
		public var sceneLoad:Vector.<uint>;//各线负载数据
		//可以进入的等级
		public var requiredLevel:int;
		
		
		public function MapInfo() 
		{
			sceneLoad = new Vector.<uint>;
		}
		
		public function setSceneData(sceneMsg:Object):void
		{
			mapData = MapDataFactory.getStaticMapData(sceneMsg);
			if (mapData)
			{
				name = mapData.name;
				if(Object(mapData).hasOwnProperty("requiredLevel"))
				{
					requiredLevel = Object(mapData)["requiredLevel"];
				}
			}
		}
	}
}