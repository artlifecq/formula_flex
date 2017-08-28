package com.rpgGame.app.manager
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.task.TaskMissionManager;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.TaskEvent;
	import com.rpgGame.coreData.cfg.InitPlayerInfoCfgData;
	import com.rpgGame.coreData.clientConfig.InitPlayerInfo;
	import com.rpgGame.coreData.clientConfig.Q_mission_base;
	import com.rpgGame.coreData.role.HeroData;
	
	import org.client.mainCore.manager.EventManager;

	/**
	 *进入游戏欢迎管理 
	 * @author dik
	 * 
	 */
	public class WelcomeManager
	{
		public static var isDestory:Boolean;
		
		public function WelcomeManager()
		{
		}
		
		/**
		 *检测是否在欢迎状态 
		 * 
		 */
		public static function checkWelcomeState():void
		{
			/*AppManager.showApp(AppConstant.WELCOME_PANEL);
			isDestory=true;
			return;*/
			if(isDestory){
				return;
			}
			var roleInfo:HeroData=MainRoleManager.actorInfo;
			var job:int=roleInfo.job;
			var sex:int=roleInfo.sex;
			var initInfo:InitPlayerInfo=InitPlayerInfoCfgData.getInitInfo(job,sex);
			if(!initInfo){
				return;
			}
			var currTask:Q_mission_base=TaskMissionManager.mainTaskData;
			if(!currTask){
				return;
			}
			if(currTask.q_mission_id==initInfo.q_task){//在创建角色的新手任务阶段
				EventManager.dispatchEvent(TaskEvent.SWITCH_TASK_BAR,false);
				AppManager.showApp(AppConstant.WELCOME_PANEL);
			}else{
				isDestory=true;
			}
		}
		
		/**
		 *销毁掉欢迎页 
		 * 
		 */
		public static function desoryWelcome():void
		{
			if(isDestory){
				return;
			}
			isDestory=true;
			AppManager.hideApp(AppConstant.WELCOME_PANEL);
			AppManager.dispose(AppConstant.getAppinfoByAppName( AppConstant.WELCOME_PANEL));
			EventManager.dispatchEvent(TaskEvent.SWITCH_TASK_BAR,true);
		}
	}
}