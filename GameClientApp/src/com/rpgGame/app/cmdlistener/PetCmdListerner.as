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
	public class PetCmdListerner extends BaseBean
	{
		public function PetCmdListerner()
		{
			super();
		}
		override public function start():void
		{
			
			SocketConnection.addCmdListener(148105,  Mgr.petMgr.ResPetListHandler);
			SocketConnection.addCmdListener(148109,  Mgr.petMgr.ResPetChangeHandler);
			SocketConnection.addCmdListener(148110, Mgr.petMgr.ResPetUpResultHandler);
			
			
			finish();
		}
		
		
		
	}
}