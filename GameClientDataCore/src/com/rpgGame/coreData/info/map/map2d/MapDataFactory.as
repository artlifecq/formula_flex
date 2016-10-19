package com.rpgGame.coreData.info.map.map2d
{
	import com.gameClient.log.GameLog;
	import com.rpgGame.coreData.info.map.EnumMapType;
	import com.rpgGame.coreData.info.map.map2d.staticMapData.IMapData;
	import com.rpgGame.coreData.info.map.map2d.staticMapData.NormalSceneData;

	/**
	 * 地图数据工厂类
	 * @author david
	 */
	public class MapDataFactory
	{
		public function MapDataFactory(){}
		
		/**
		 * 获取地图静态数据
		 * @param data 对应的proto数据
		 */
		public static function getStaticMapData(data:Object):IMapData
		{
			var iMapData:IMapData;
			if(data)
			{
				iMapData = new NormalSceneData(); 
				iMapData.mapType = EnumMapType.MAP_TYPE_NORMAL;
			}
			
			if(iMapData)
			{
				iMapData.setData(data);
			}else
			{
				GameLog.addError("##出错啦，这个地图proto解析没有添加" + data);
			}
			return iMapData;
		}
	}
}