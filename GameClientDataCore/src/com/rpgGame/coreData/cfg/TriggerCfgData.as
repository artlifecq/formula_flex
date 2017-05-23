package com.rpgGame.coreData.cfg
{
	import com.game.engine3D.vo.map.ClientMapAreaData;
	import com.game.engine3D.vo.map.MapAreaTypeEnum;
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.coreData.clientConfig.ClientTrigger;
	import com.rpgGame.coreData.clientConfig.Q_area;
	import com.rpgGame.coreData.clientConfig.Q_map_trigger;
	import com.rpgGame.coreData.clientConfig.Q_zone_multy;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	/**
	 * 触发配置表
	 * @author yt
	 * 
	 */	
	public class TriggerCfgData
	{
		public function TriggerCfgData()
		{
			
		}
		private static var _dataDic : Dictionary = new Dictionary();
		private static var _trigers:Vector.<ClientTrigger>=new Vector.<ClientTrigger>();
		//private static var _areaDic : Dictionary = new Dictionary();
		public static function setup(data : ByteArray) : void {
			var arr : Array = data.readObject();
			var areaData:ClientMapAreaData;
			var qarea:Q_area;
			var triger:ClientTrigger;
			for each(var info :Q_map_trigger in arr) {
				_dataDic[info.q_id] = info;
				
				triger=new ClientTrigger();
				triger.id=info.q_id;
				triger.name=info.q_name
				
				triger.zoneId=info.q_zone_Id;
				triger.triggerType=info.q_trigger_type;
				triger.areaId=info.q_trigger_area_id;
				triger.preTrigger=JSONUtil.decode(info.q_pre_trigger);
				triger.obstacleArea=JSONUtil.decode(info.q_area_id);
				triger.sceneEffectIds=JSONUtil.decode(info.q_effectIds);
				triger.obstacleAreaRemove=JSONUtil.decode(info.q_area_remove_id);
				triger.sceneEffectRemove=JSONUtil.decode(info.q_remove_effectIds);
				if(info.q_trigger_type==1)
				{
					qarea=AreaCfgData.getAreaByID(info.q_trigger_area_id);
					if (qarea)
					{
						triger.sceneId=qarea.q_map_id;
					}
				}
				_trigers.push(triger);
				
			}
		}
		/**返回地图触发区域列表*/
		public static function getClientTrigger(trid:int):ClientTrigger
		{
			for each(var info :ClientTrigger in _trigers)
			{
				if(info.id==trid)
				{
					return info;
				}
				
			}
			return null;
		}
		/**返回地图触发区域列表*/
		public static function getTriggerAreas(mid:int):Vector.<ClientTrigger>
		{
			var triggerList:Vector.<ClientTrigger>=new Vector.<ClientTrigger>();
			
			for each(var info :ClientTrigger in _trigers)
			{
				if(info.triggerType==1&&info.sceneId==mid)
				{
					triggerList.push(info);
				}
				
			}
			return triggerList;
		}
		
		
	}
}