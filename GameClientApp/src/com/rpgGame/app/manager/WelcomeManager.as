package com.rpgGame.app.manager
{
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.scene.render.SceneRenderCache;
	import com.game.engine3D.scene.render.vo.RenderParamData3D;
	import com.game.engine3D.scene.render.vo.RenderResourceData;
	import com.gameClient.log.GameLog;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.task.TaskMissionManager;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.TaskEvent;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.InitPlayerInfoCfgData;
	import com.rpgGame.coreData.clientConfig.InitPlayerInfo;
	import com.rpgGame.coreData.clientConfig.Q_mission_base;
	import com.rpgGame.coreData.role.HeroData;
	
	import away3d.enum.LoadPriorityType;
	
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
				var _renderParamData:RenderParamData3D=new RenderParamData3D(0,"effect_ui",ClientConfig.getEffect("ui_kaishiyouxi"));
				_renderParamData.priority=LoadPriorityType.LEVEL_CUSTOM_4;
				var uint:RenderUnit3D=RenderUnit3D.create(_renderParamData);
				var _renderResourceData:RenderResourceData=SceneRenderCache.installRenderResourceData(_renderParamData.sourcePath,_renderParamData.animatorSourchPath,uint);
				_renderResourceData.setResCompleteCallBack(onSetRenderResourceData);
				_renderResourceData.setResErrorCallBack(onRenderResourceDataError);
				_renderResourceData.loadSource(_renderParamData.sourcePath, _renderParamData.animatorSourchPath, _renderParamData.priority);
			}else{
				isDestory=true;
			}
		}
		
		private static function onSetRenderResourceData(resData : RenderResourceData) : void
		{
			if (resData)
			{
				AppManager.showApp(AppConstant.WELCOME_PANEL);
			}
		}
		
		private static function onRenderResourceDataError(resData : RenderResourceData) : void
		{
			//执行错误回调
			GameLog.addShow("加载欢迎素材错误...");
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