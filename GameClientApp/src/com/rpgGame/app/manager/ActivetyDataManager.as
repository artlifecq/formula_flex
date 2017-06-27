package com.rpgGame.app.manager
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.ui.main.buttons.MainButtonManager;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.coreData.cfg.active.ActivetyCfgData;
	import com.rpgGame.coreData.cfg.active.ActivetyInfo;
	import com.rpgGame.coreData.cfg.active.BossActInfo;
	import com.rpgGame.coreData.clientConfig.Q_special_activities;
	import com.rpgGame.netData.specialactivities.bean.SpecialActivityInfo;

	/**
	 *活动大厅数据管理器 
	 * @author dik
	 * 
	 */
	public class ActivetyDataManager
	{
		public function ActivetyDataManager()
		{
		}
		
		/**
		 *更新击杀者 
		 * 
		 */
		public static function updateBossKiller(id:int,killer:String):void
		{
			var bossInfo:BossActInfo=ActivetyCfgData.getActInfoById(id) as BossActInfo;
			if(bossInfo){
				bossInfo.killerName=killer;
			}
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
		
		public static function getNextRefreshTime(cfg:Q_special_activities):String
		{
			var hm:int=getCurrentHM();
			var timeList:Array=getTimeList(cfg);
			timeList=timeList[4];//第四个才是刷新段
			var num:int=timeList.length;
			var next:int=timeList[0];
			for(var i:int=0;i<num;i++){
				if(i%2!=0){
					continue;
				}else{
					if(timeList[i]>hm){
						break;
					}
					next=timeList[i];
				}
			}
			return TimeUtil.changeIntHM2Str(next);
		}
		
		/**
		 *获取当前时间和配置一致的时分格式 
		 * @return 
		 * 
		 */
		public static function getCurrentHM():int
		{
			var currentTime:Date=SystemTimeManager.sysDateTime;
			var hour:int=currentTime.hours;
			var min:int=currentTime.minutes;
			var sec:int=hour*60*60+min*60;
			var timeStr:String=TimeUtil.formatTimeToTimeString(sec);
			var arrTime:Array=timeStr.split(":");
			var hm:int=int(arrTime[0]+arrTime[1]);
			return hm;
		}
		
		/**
		 *检测开启活动 
		 * 
		 */
		public static function checkOpenAct():void
		{
			var types:Array=ActivetyCfgData.getTypes();
//			updateActLeftTime(106,1000);
			for each(var type:int in types){
				var typeList:Vector.<ActivetyInfo>=ActivetyCfgData.getTypeList(type);
				if(typeList){
					for each(var info:ActivetyInfo in typeList){
						if(info.actCfg.q_icon_id!=0&&info.info){//有独立的功能icon
							if(info.info.notifyTime!=-1){//在预告时间内
								MainButtonManager.openActByData(info.actCfg.q_icon_id,info);
							}
						}
					}
				}
			}
		}
		
		/**
		 *更新信息 
		 * @param info
		 * 
		 */
		public static  function updateInfo(info:SpecialActivityInfo):void
		{
			var typeList:Vector.<ActivetyInfo>=ActivetyCfgData.getTypeList(info.activityType);
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
		
		public static function sortAllDatas():void
		{
			ActivetyCfgData.sortAllDatas();
		}
		
		/**
		 * 设置活动状态
		 * @param id
		 * @param state
		 * 
		 */
		public static function setActState(id:int,state:int):void
		{
			var info:ActivetyInfo=ActivetyCfgData.getActInfoById(id);
			if(!info.info){
				return;
			}
			info.info.joinState=state;
			ActivetyCfgData.sortTypeList(info.info.activityType);
		}
	}
}