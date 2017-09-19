package com.rpgGame.app.manager.fulidating
{
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.ui.main.buttons.MainButtonManager;
	import com.rpgGame.core.events.ServerActiveEvent;
	import com.rpgGame.coreData.enum.EmMainBtnID;
	import com.rpgGame.netData.gameactivities.bean.onlineInfo;
	import com.rpgGame.netData.gameactivities.message.SCOnlineInfoMessage;
	import com.rpgGame.netData.gameactivities.message.SCOnlineRewardMessage;
	
	import org.client.mainCore.manager.EventManager;
	
	public class ZaiXianManager
	{
		private static var _instance:ZaiXianManager;
		public static function get instance():ZaiXianManager
		{
			if(_instance == null)
				_instance = new ZaiXianManager();
			return _instance;
		}
		
		private var _zaixianInfos:Vector.<onlineInfo>=new Vector.<onlineInfo>();
		
		public function getonlineInfoByTime(time:int):onlineInfo
		{
			if(_zaixianInfos==null||_zaixianInfos.length==0) return null;
			for(var i:int=0;i<_zaixianInfos.length;i++)
			{
				if(_zaixianInfos[i].time==time) return _zaixianInfos[i];
			}
			return null;
		}
		
		
		/**在线信息数据*/
		public function onSCOnlineInfoMessage(msg:SCOnlineInfoMessage):void
		{
			_zaixianInfos=msg.info;
			MainButtonManager.setActivityPointNumButton(EmMainBtnID.FULIDATING,Mgr.dengjiMgr.chackCanGetNum());
			EventManager.dispatchEvent(ServerActiveEvent.SERVERACTIVE_ONLINE_TIME,msg.onlineTime);
		}
		
		/**在线奖励领取反馈*/		
		public function onSCOnlineRewardMessage(msg:SCOnlineRewardMessage):void
		{
			EventManager.dispatchEvent(ServerActiveEvent.SERVERACTIVE_ONLINE_PICKUP,msg);
		}
		
		public function chackNot():Boolean
		{
			if(_zaixianInfos==null) return false;
			for(var i:int=0;i<_zaixianInfos.length;i++)
			{
				if(_zaixianInfos[i].state==1) return true;
			}
			return false;
		}
	}
}
