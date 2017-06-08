package com.rpgGame.app.cmdlistener.mount
{
	import com.rpgGame.app.manager.mount.ZhanQiManager;
	import com.rpgGame.netData.warFlag.message.SCWarFlagAllInfoToClientMessage;
	import com.rpgGame.netData.warFlag.message.SCWarFlagExtraItemNumMessage;
	import com.rpgGame.netData.warFlag.message.SCWarFlagModelIdChangMessage;
	import com.rpgGame.netData.warFlag.message.SCWarFlagUpResultToClientMessage;
	
	import org.client.mainCore.bean.BaseBean;
	import org.game.netCore.connection.SocketConnection;
	
	public class ZhanQiCmdListener extends BaseBean
	{
		override public function start():void
		{
			SocketConnection.addCmdListener(229101, onSCWarFlagAllInfoToClientMessage);
			SocketConnection.addCmdListener(229106,onSCWarFlagExtraItemNumMessage);
			SocketConnection.addCmdListener(229105,onSCWarFlagUpResultToClientMessage);
			SocketConnection.addCmdListener(229107,onSCWarFlagModelIdChangMessage);
			super.finish();
		}
		
		/**
		 * 接收当前战旗的数据
		 * */
		public function onSCWarFlagAllInfoToClientMessage(msg:SCWarFlagAllInfoToClientMessage):void
		{
			ZhanQiManager.instance().onSCWarFlagAllInfoToClientMessage(msg);
		}
		
		/**
		 * 接收资质丹、成长丹使用消息
		 * */
		public function onSCWarFlagExtraItemNumMessage(msg:SCWarFlagExtraItemNumMessage):void
		{
			ZhanQiManager.instance().onSCWarFlagExtraItemNumMessage(msg);
		}
		
		/**
		 * 升阶结果反馈
		 * */
		public function onSCWarFlagUpResultToClientMessage(msg:SCWarFlagUpResultToClientMessage):void
		{
			ZhanQiManager.instance().onSCWarFlagUpResultToClientMessage(msg);
		}
		
		/**
		 * 同步战旗信息给周围玩家
		 * */
		public function onSCWarFlagModelIdChangMessage(msg:SCWarFlagModelIdChangMessage):void
		{
			ZhanQiManager.instance().onSCWarFlagModelIdChangMessage(msg);
		}
	}
}