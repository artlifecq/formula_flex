package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.Q_lunjian;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.info.map.SceneData;
	
	import flash.utils.ByteArray;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 *论剑配置
	 *@author dik
	 *2017-5-6下午2:01:04
	 */
	public class LunJianCfg
	{
		private static var npcMapData:HashMap;
		private static var idMapData:HashMap;
		public static var mapDatas:Array;
		
		public function LunJianCfg()
		{
		}
		
		public static function setup(data : ByteArray) : void
		{
			var arr : Array = data.readObject();
			var num:int=arr.length;
			npcMapData=new HashMap();
			idMapData=new HashMap();
			mapDatas=new Array();
			var mapIds:Array=new Array();
			var info:Q_lunjian;
			var i:int;
			var mapData:HashMap;
			for(i=0;i<num;i++){
				info=arr[i];
				var key:String=info.q_npc_map+"_"+info.q_type+"_"+info.q_difficult;
				mapData=npcMapData.getValue(info.q_npc_map);
				idMapData.add(info.q_id,info);
				if(!mapData){
					mapData=new HashMap();
					npcMapData.add(info.q_npc_map,mapData);
				}
				mapData.add(key,info);
				if(mapIds.indexOf(info.q_npc_map)==-1){
					mapIds.push(info.q_npc_map);
				}
			}
			
			num=mapIds.length;
			var mapCfg:SceneData;
			for(i=0;i<num;i++){
				mapCfg=MapDataManager.getMapInfo(mapIds[i]);
				if(mapCfg){
					mapDatas.push(mapCfg);
				}
			}
		}
		
		/**
		 *根据地图id获取对应的数据 
		 * @param mapId
		 * @return 
		 * 
		 */
		public static function getCfgByMapId(mapId:int):Vector.<Q_lunjian>
		{
			var mapData:HashMap=npcMapData.getValue(mapId);
			var values:Array=mapData.getValues();
			var num:int=values.length;
			var i:int;
			var data:Q_lunjian;
			var result:Vector.<Q_lunjian>=new Vector.<Q_lunjian>();
			for(i=0;i<num;i++){
				data=values[i];
				if(data.q_difficult==1){//只需要取一级的数据
					result.push(data);
				}
			}
			return result;
		}
		
		/**
		 *根据信息获取 
		 * @param mapId
		 * @param type
		 * @param dif
		 * @return 
		 * 
		 */
		public static function getCfgByInfo(mapId:int,type:int,dif:int):Q_lunjian
		{
			var key:String=mapId+"_"+type+"_"+dif;
			var mapData:HashMap=npcMapData.getValue(mapId);
			if(mapData){
				return mapData.getValue(key);
			}
			return null;
		}
		
		/**
		 *根据id获取 
		 * @param id
		 * @return 
		 * 
		 */
		public static function getCfgByID(id:int):Q_lunjian
		{
			return idMapData.getValue(id);
		}
	}
}