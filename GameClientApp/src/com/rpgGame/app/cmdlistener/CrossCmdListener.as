package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.manager.scene.FirstEnterSceneManager;
	import com.rpgGame.app.sender.CrossSender;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.coreData.cfg.GlobalSheetData;
	import com.rpgGame.netData.cross.message.ResChangeServerGameToClientMessage;
	
	import away3d.log.Log;
	
	import gs.TweenLite;
	
	import org.client.mainCore.bean.BaseBean;
	import org.game.netCore.connection.SocketConnection;
	import org.game.netCore.net.BeanConfig;
	
	/**
	 *跨服相关处理
	 *@author dik
	 *2017-5-24下午3:23:42
	 */
	public class CrossCmdListener extends BaseBean
	{
		public function CrossCmdListener()
		{
			super();
		}
		
		override public function start():void
		{
			SocketConnection.addCmdListener(250101, onResChangeServerGameToClient );
			finish();
		}
		
		private function onResChangeServerGameToClient( msg:ResChangeServerGameToClientMessage ):void
		{
			Log.debug("通知前端登录战斗服ResChangeServerGameToClientMessage");
			var time:int;
			if(!FirstEnterSceneManager.isEnterScene)//第一次进入场景 只用延迟2秒就可以了
			{
				time=2;
			}
			else
			{
				time=GlobalSheetData.getSettingInfo(849)!=null?GlobalSheetData.getSettingInfo(849).q_int_value:15;
				if(msg.fighttype==2)
				{
					AppManager.showAppNoHide(AppConstant.BATTLE_D1V1_MATCH_PANEL,[1,time]);
				}
				else
				{
					AppManager.showAppNoHide(AppConstant.MULTY_ENTERTIME_PANL,msg.fighttype);
				}
			}
			TweenLite.killDelayedCallsTo(sendEnterCrossFight);
			TweenLite.delayedCall(time,sendEnterCrossFight,[msg]);
		}
		private function sendEnterCrossFight(msg:ResChangeServerGameToClientMessage):void
		{
			CrossSender.reqEnterCrossFight(msg);
		}
	}
}