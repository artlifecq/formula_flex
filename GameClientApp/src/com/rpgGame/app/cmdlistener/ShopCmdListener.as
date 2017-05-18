package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.manager.Mgr;
	
	import org.client.mainCore.bean.BaseBean;
	import org.game.netCore.connection.SocketConnection;

	/**
	 *
	 * @author yfl
	 */
	public class ShopCmdListener extends BaseBean
	{
		override public function start():void
		{
			SocketConnection.addCmdListener(149101,Mgr.shopMgr.SCSaleSuccessHandler);
			SocketConnection.addCmdListener(149102,Mgr.shopMgr.SCRebuySuccessHandler);
			SocketConnection.addCmdListener(149103, Mgr.shopMgr.SCRebuyItemInfosHandler);
			SocketConnection.addCmdListener(149105, Mgr.shopMgr.SCBuyItemResultHandler);
			SocketConnection.addCmdListener(149106, Mgr.shopMgr.SCSendShopListHandler);
			SocketConnection.addCmdListener(149107, Mgr.shopMgr.SCSendShopItemChangeHandler);
			finish();
		}	
		
		
	}
}