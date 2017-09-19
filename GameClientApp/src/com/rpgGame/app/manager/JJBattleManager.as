package com.rpgGame.app.manager
{
	import com.game.engine3D.manager.InputManger;
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.sender.JJBattleSender;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.JJBattleEvent;
	import com.rpgGame.core.events.MapEvent;
	import com.rpgGame.coreData.cfg.GlobalSheetData;
	import com.rpgGame.coreData.clientConfig.Q_global;
	import com.rpgGame.coreData.clientConfig.Q_map;
	import com.rpgGame.coreData.enum.EmFunctionID;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.info.map.EnumMapType;
	import com.rpgGame.coreData.type.SceneCharType;
	import com.rpgGame.netData.zhengba.bean.ZhengBaData;
	import com.rpgGame.netData.zhengba.message.SCChallengeDataMessage;
	import com.rpgGame.netData.zhengba.message.SCChallengeResultMessage;
	import com.rpgGame.netData.zhengba.message.SCDrawAwardResultMessage;
	import com.rpgGame.netData.zhengba.message.SCJJReadyToStartMessage;
	import com.rpgGame.netData.zhengba.message.SCOpenArardPanelMessage;
	import com.rpgGame.netData.zhengba.message.SCUpdateZhengBaDataMessage;
	
	import flash.geom.Vector3D;
	import flash.utils.getTimer;
	
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.data.long;

	public class JJBattleManager
	{
		public static var  ins:JJBattleManager=new   JJBattleManager();
		private var _data:ZhengBaData;
		private var _max:int=-1;
		private var _lockPos:Vector3D;
		private var _lockRole:SceneRole;
		private var _isLock:Boolean;
		public function getMaxRankLv():int
		{
			if (_max==-1) 
			{
				
				var num:int=GlobalSheetData.getIntValue(800);
				var gmax:String=GlobalSheetData.getStrValue(800+num);
				var obj:Object=JSONUtil.decode(gmax);
				_max=obj[0].rank[0];
			}
		
			return _max;
		}
		public function JJBattleManager()
		{
			EventManager.addEvent(MapEvent.MAP_SWITCH_COMPLETE,checkLockMap);
		}
		public function reqBuyTimesOrPower(type:int):void
		{
			JJBattleSender.reqBuyTimeOrPower(type);
		}
		public  function reqChallegeRankData(type:int):void
		{
			JJBattleSender.reqChallegeRankData(type);
		}
		public  function reqGetReward():void
		{
			JJBattleSender.reqGetReward();
		}
		private var lastTime:int;
		public  function reqStartFight(player:long,type:int):void
		{
			if (getTimer()-lastTime<1000) 
			{
				return;
			}
			lastTime=getTimer();
			JJBattleSender.reqStartFight(player,type);
		}
		public  function reqRewardPanelData():void
		{
			JJBattleSender.reqRewardPanelData();
		}
		public function SCOpenArardPanelHandler(msg:SCOpenArardPanelMessage):void
		{
			// TODO Auto Generated method stub
			EventManager.dispatchEvent(JJBattleEvent.GET_REWARD_PANEL_DATA,msg.win,msg.defeat,msg.reputation);
		}
		
		public function SCUpdateZhengBaDataHandler(msg:SCUpdateZhengBaDataMessage):void
		{
			// TODO Auto Generated method stub
			_data=msg.zhengBaData;
			EventManager.dispatchEvent(JJBattleEvent.GET_PANEL_DATA);
		}
		
		public function SCDrawAwardResultHandler( msg:SCDrawAwardResultMessage):void
		{
			// TODO Auto Generated method stub
			if (msg.result==1) 
			{
				data.drawAward=1;
			}
			EventManager.dispatchEvent(JJBattleEvent.GET_REWARD_RESULT,msg.result);
		}
		
		public function SCChallengeResultHandler(msg:SCChallengeResultMessage):void
		{
			// TODO Auto Generated method stub
			//EventManager.dispatchEvent(JJBattleEvent.GET_FIGHT_RESULT,msg);
			AppManager.showApp(AppConstant.BATTLE_RESULT_PANEL,[msg.victoryInfo.playerId.EqualTo(MainRoleManager.actorInfo.serverID),msg.rank,msg.awardItemInfos]);
			AppManager.hideApp(AppConstant.BATTLE_JJBT_HEAD_PANEL);
			AppManager.hideApp(AppConstant.BATTLE_JJBT_OVER_PANEL);
		}
		
		public function SCChallengeDataHandler(msg:SCChallengeDataMessage):void
		{
			// TODO Auto Generated method stub
			_data=msg.zhengBaData;
			EventManager.dispatchEvent(JJBattleEvent.GET_PANEL_DATA);
			EventManager.dispatchEvent(JJBattleEvent.GET_FIGHTERS_DATA,msg.type,msg.zhengBaBriefInfo);
		}

		public function get data():ZhengBaData
		{
			return _data;
		}
		public function isJJZB():Boolean
		{
			var map:Q_map=MapDataManager.currentScene.getData();
			return (map&&EnumMapType.MAP_TYPE_JJZB==map.q_map_type)
		}
		public function checkLockMap():void
		{
			var map:Q_map=MapDataManager.currentScene.getData();
			if (map&&EnumMapType.MAP_TYPE_JJZB==map.q_map_type)
			{
				lockCamera();
			}
			else
			{
				unLockCamera();
			}
		}
		public function lockCamera():void
		{
			if (_isLock) 
			{
				return;
			}
			_isLock=true;
			if (_lockPos==null) 
			{
				_lockPos=new Vector3D(1347,-1198,-1198);
				var arr:Array=JSONUtil.decode(GlobalSheetData.getStrValue(907)) as Array;
				if (arr) 
				{
					_lockPos.x=int(arr[0]);
					_lockPos.y=int(arr[1]);
					_lockPos.z=int(arr[1]);
				}
				_lockRole=new SceneRole(SceneCharType.DUMMY,0);
				_lockRole.position=_lockPos;
				_lockRole.speed=MainRoleManager.actor.speed;
				
			}
			AppManager.hideApp(AppConstant.BATTLE_MAIN_PANEL);
			MainRoleManager.actor.lookPos=_lockPos;
			SceneManager.scene.cameraLookAt(_lockRole);
			MainUIManager.setMainUIVisible(false);
			InputManger.getInstance().closeOperate();
			
		}
		public function unLockCamera():void
		{
			if (!_isLock) 
			{
				return;
			}
			_isLock=false;
			MainRoleManager.actor.lookPos=null;
			SceneManager.scene.cameraLookAt(MainRoleManager.actor);
			MainUIManager.setMainUIVisible(true);
			InputManger.getInstance().openOperate();
			//AppManager.showApp(AppConstant.BATTLE_MAIN_PANEL);
			FunctionOpenManager.openPanelByFuncID(EmFunctionID.EM_JINGJIZHENGBA);
		}
		public function SCJJReadyToStartHandler(msg:SCJJReadyToStartMessage):void
		{
			// TODO Auto Generated method stub
			AppManager.showApp(AppConstant.BATTLE_JJBT_HEAD_PANEL,msg);
			AppManager.hideApp(AppConstant.BATTLE_MAIN_PANEL);
		}
		public function reqJumpOver():void
		{
			JJBattleSender.reqJumpOver();
		}
	}
}