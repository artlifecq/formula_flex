package com.rpgGame.coreData.cfg.active
{
	import com.gameClient.utils.JSONUtil;
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
		private static var _infoMap:HashMap;
		
		public static function setup( data:ByteArray ):void
		{
			var arr : Array = data.readObject();
			var num:int=arr.length;
			var info:Q_special_activities;
			_typeMap=new HashMap();
			_infoMap=new HashMap();
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
			if(cfg.q_activity_type==1){
				info=new BossActInfo();
			}else{
				info=new ActivetyInfo();
			}
			info.actCfg=cfg;
			_infoMap.add(cfg.q_activity_id,info);
			typeList.push(info);
		}
		
		/**
		 *根据配置获取时间列表 
		 * @param cfg
		 * @return 
		 * 
		 */
		public static function getTimeList(cfg:Q_special_activities):Array
		{
			var arr:Array=JSONUtil.decode(cfg.q_activity_time);
			return arr;
		}
		
		/**
		 *根据活动id获取活动信息 
		 * @param id
		 * @return 
		 * 
		 */
		public static function getActInfoById(id:int):ActivetyInfo
		{
			return _infoMap.getValue(id);
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
			if(!typeList){
				return;
			}
			var num:int=typeList.length;
			for(var i:int=0;i<num;i++){
				if(typeList[i].actCfg.q_activity_id==info.activityId){
					typeList[i].info=info;
					return;
				}
			}
		}
		
		/**
		 *更新击杀者 
		 * 
		 */
		public static function updateBossKiller(id:int,killer:String):void
		{
			var bossInfo:BossActInfo=getActInfoById(id) as BossActInfo;
			if(bossInfo){
				bossInfo.killerName=killer;
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
			if(!typeList){
				return;
			}
			typeList=typeList.sort(sortListByID);
			typeList=typeList.sort(sortListByState);
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
				if(!values){
					continue;
				}
				values=values.sort(sortListByID);
				values=values.sort(sortListByState);
			}
		}
		
		private static function sortListByID(infoA:ActivetyInfo,infoB:ActivetyInfo):int
		{
			if(infoA.info==null||infoB.info==null){
				return 0;
			}
			if(infoA.info.activityId<infoB.info.activityId){
				return -1;
			}else if(infoA.info.activityId>infoB.info.activityId){
				return 1;
			}
			return 0;
		}
		
		private static function sortListByState(infoA:ActivetyInfo,infoB:ActivetyInfo):int
		{
			if(infoA.info==null||infoA.info==null){
				return 0;
			}
			if(infoA.info.joinState>infoB.info.joinState){
				return -1;
			}else if(infoA.info.joinState<infoB.info.joinState){
				return 1;
			}
			return 0;
		}
	}
}