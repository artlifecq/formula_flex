package com.rpgGame.coreData.cfg.active
{
	import com.rpgGame.coreData.cfg.active.ActivetyInfo;
	import com.rpgGame.coreData.clientConfig.Q_special_activities;
	import com.rpgGame.netData.specialactivities.bean.SpecialActivityInfo;
	
	import flash.utils.ByteArray;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 *活动配置数据 
	 * @author dik
	 * 
	 */
	public class ActivetyDataManager
	{
		public function ActivetyDataManager()
		{
		}
		private static var _typeMap:HashMap;
		
		public static function setup( data:ByteArray ):void
		{
			var arr : Array = data.readObject();
			var num:int=arr.length;
			var info:Q_special_activities;
			_typeMap=new HashMap();
			for(var i:int=0;i<num;i++){
				info=arr[i];
				addCfg(info);
			}
		}
		
		/**
		 *添加配置 
		 * @param cfg
		 * 
		 */
		private static function addCfg(cfg:Q_special_activities):void
		{
			var typeList:Vector.<ActivetyInfo>=_typeMap.getValue(cfg.q_activity_type);
			var info:ActivetyInfo;
			if(!typeList){
				typeList=new Vector.<ActivetyInfo>();
				_typeMap.add(cfg.q_activity_type,typeList);
			}
			info=new ActivetyInfo();
			info.cfg=cfg;
			typeList.push(info);
		}
		
		/**
		 *获取活动列表 
		 * @param type
		 * @return 
		 * 
		 */
		public static function getActiveList(type:int):Vector.<ActivetyInfo>
		{
			return _typeMap.getValue(type);
		}
		
		/**
		 *更新信息 
		 * @param info
		 * 
		 */
		public static  function updateInfo(info:SpecialActivityInfo):void
		{
			var typeList:Vector.<ActivetyInfo>=_typeMap.getValue(info.activityType);
//			typeList=typeList.sort(sortListByID);
			var num:int=typeList.length;
			for(var i:int=0;i<num;i++){
				if(typeList[i].cfg.q_activity_id==info.activityId){
					typeList[i].info=info;
//					typeList=typeList.sort(sortListByState);
					return;
				}
			}
		}
		
		/**
		 * 设置活动状态
		 * @param id
		 * @param state
		 * 
		 */
		public static function setActState(id:int,state:int):void
		{
			var info:ActivetyInfo=getActInfoById(id);
			info.info.joinState=state;
			var typeList:Vector.<ActivetyInfo>=_typeMap.getValue(info.info.activityType);
			typeList=typeList.sort(sortListByID);
			typeList=typeList.sort(sortListByState);
		}
		
		/**
		 *根据活动id得到活动信息 
		 * @return 
		 * 
		 */
		public static function getActInfoById(id:int):ActivetyInfo
		{
			var keys:Array=_typeMap.keys();
			for each(var key:int in keys){
				var values:Vector.<ActivetyInfo>=_typeMap.getValue(key);
				for(var i:int=0;i<values.length;i++){
					if(values[i].cfg.q_activity_id==id){
						return values[i];
					}
				}
			}
			return null;
		}
		
		/**
		 *排序所有数据 
		 * 
		 */
		public static function sortAllDatas():void
		{
			var keys:Array=_typeMap.keys();
			for each(var key:int in keys){
				var values:Vector.<ActivetyInfo>=_typeMap.getValue(key);
				values=values.sort(sortListByID);
				values=values.sort(sortListByState);
			}
		}
		
		private static function sortListByID(infoA:ActivetyInfo,infoB:ActivetyInfo):int
		{
			if(infoA.info.activityId<infoB.info.activityId){
				return -1;
			}else if(infoA.info.activityId>infoB.info.activityId){
				return 1;
			}
			return 0;
		}
		
		private static function sortListByState(infoA:ActivetyInfo,infoB:ActivetyInfo):int
		{
			if(infoA.info.joinState>infoB.info.joinState){
				return -1;
			}else if(infoA.info.joinState<infoB.info.joinState){
				return 1;
			}
			return 0;
		}

	}
}