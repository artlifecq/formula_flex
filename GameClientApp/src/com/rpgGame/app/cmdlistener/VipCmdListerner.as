package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.manager.Mgr;
	
	import org.client.mainCore.bean.BaseBean;
	import org.game.netCore.connection.SocketConnection;

	/**
	 *vip
	 * @author Administrator
	 * 
	 */	
	public class VipCmdListerner extends BaseBean
	{
		public function VipCmdListerner()
		{
			super();
		}
		override public function start():void
		{
			
			SocketConnection.addCmdListener(191101, Mgr.vipMgr.recVipPanelData);
			finish();
		}
		
		
	}
}