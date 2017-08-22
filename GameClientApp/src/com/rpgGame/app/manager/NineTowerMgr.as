package com.rpgGame.app.manager
{
	import com.rpgGame.app.manager.hint.FloatingText;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.sender.NineTowerSender;
	import com.rpgGame.app.state.role.RoleStateUtil;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.NineTowerEvent;
	import com.rpgGame.coreData.cfg.NotifyCfgData;
	import com.rpgGame.coreData.enum.EmFunctionID;
	import com.rpgGame.netData.yaota.message.SCDrawYaoTaAwardMessage;
	import com.rpgGame.netData.yaota.message.SCEnterYaoTaResultMessage;
	import com.rpgGame.netData.yaota.message.SCGetPlayerPostionMessage;
	import com.rpgGame.netData.yaota.message.SCOpenYaoTaPanelMessage;
	import com.rpgGame.netData.yaota.message.SCQuitYaoTaMessage;
	import com.rpgGame.netData.yaota.message.SCUpdateYaoTaMessage;
	import com.rpgGame.netData.yaota.message.SCWarChessMessage;
	import com.rpgGame.netData.yaota.message.SCYaoTaAwardMessage;
	import com.rpgGame.netData.yaota.message.SCYaoTaIntegralMessage;
	import com.rpgGame.netData.yaota.message.SCYaoTaLogMessage;
	
	import flash.geom.Vector3D;
	
	import org.client.mainCore.manager.EventManager;
	
	public class NineTowerMgr
	{
		public static const ACTIVITY_ID:int=3;
		public static var ins:NineTowerMgr=new NineTowerMgr();
		public var data:SCUpdateYaoTaMessage;
		public var flagData:SCWarChessMessage;
		
		
		public function NineTowerMgr()
		{
		}
		public function reqPanelData():void
		{
			NineTowerSender.reqPanelData();
			
		}
		public function reqEnterTower():void
		{
			NineTowerSender.reqEnterTower(ACTIVITY_ID)
			
		}
		public function reqQuitTower():void
		{
			NineTowerSender.reqQuitTower()
			
		}
		public function reqTowerScore():void
		{
			NineTowerSender.reqTowerScore()
			
		}
		public function reqTowerLog():void
		{
			NineTowerSender.reqTowerLog();
			
		}
		public function SCDrawYaoTaAwardHandler(msg:SCDrawYaoTaAwardMessage):void
		{
			var arr:Array=[];
			var len:int=msg.itemModelIds.length;
			for (var i:int = 0; i < len; i++) 
			{
				arr.push(msg.itemModelIds[i].mod);
			}
			
			ItemActionManager.flyItemsToBag(arr);
		}
		public function SCEnterYaoTaResultHandler(msg:SCEnterYaoTaResultMessage):void
		{
			if (msg.result) 
			{
				AppManager.showApp(AppConstant.BATTLE_NINE_TOWER_NOTICE_PANEL,msg.tier);
			}
			
		}
		public function SCYaoTaLogHandler(msg:SCYaoTaLogMessage):void
		{
			EventManager.dispatchEvent(NineTowerEvent.GET_LOG_DATA,msg.yaoTaInfos);
		}
		
		public function SCUpdateYaoTaHandler(msg:SCUpdateYaoTaMessage):void
		{
			data=msg;
			EventManager.dispatchEvent(NineTowerEvent.GET_TRACK_DATA,msg);
		}
		public function SCYaoTaIntegralHandler(msg:SCYaoTaIntegralMessage):void
		{
			EventManager.dispatchEvent(NineTowerEvent.GET_SCORE_RANK_DATA,msg);
		}
		
		public function SCQuitYaoTaHandler(msg:SCQuitYaoTaMessage):void
		{
			
		}
		
		public function SCYaoTaAwardHandler(msg:SCYaoTaAwardMessage):void
		{
			AppManager.showApp(AppConstant.BATTLE_NINE_TOWER_RESULT_PANEL,msg);
		}
		public function SCOpenYaoTaPanelHandler(msg:SCOpenYaoTaPanelMessage):void
		{
			// TODO Auto Generated method stub
			EventManager.dispatchEvent(NineTowerEvent.GET_PANEL_DATA,msg.type);
		}
		
		public function SCWarChessHandler(msg:SCWarChessMessage):void
		{
			// TODO Auto Generated method stub
			this.flagData=msg;
			EventManager.dispatchEvent(NineTowerEvent.GET_TRACK__FLAG_DATA,msg);
		}
		public  function SCGetPlayerPostionHandler(msg:SCGetPlayerPostionMessage):void
		{
			if (msg.positions) 
			{
				var pos:Vector3D=new Vector3D();
				pos.x=msg.positions.x;
				pos.y=msg.positions.y;
				RoleStateUtil.walkToPos(MainRoleManager.actor,pos);
			}
		}
		public function autoJoin():void
		{
			if (FunctionOpenManager.functionIsOpen(EmFunctionID.EM_TOWERS)) 
			{
				reqEnterTower();
				FunctionOpenManager.openAppPaneById(EmFunctionID.EM_TOWERS);
			}
			else
			{
				FloatingText.showUp(NotifyCfgData.getNotifyTextByID(61040));
			}
		}
	}
}