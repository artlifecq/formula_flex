package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.look.LookManager;
	import com.rpgGame.app.utils.ReqLockUtil;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.LookEvent;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.lang.LangLook;
	
	import flash.utils.ByteArray;
	
	import app.cmd.ViewOtherHeroModuleMessages;
	import app.message.OtherHeroProto;
	
	import org.client.mainCore.bean.BaseBean;
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.connection.SocketConnection;
	import org.game.netCore.net.ByteBuffer;
	import org.game.netCore.net.BytesUtil;
	
	import utils.TimerServer;
	
	/**
	 * @author 刘吉
	 * @E-mail:liuji@mokylin.com
	 * 创建时间：2016-8-11 下午6:18:03
	 */
	
	public class LookCmdListener extends BaseBean
	{
		public function LookCmdListener()
		{
			super();
		}
		
		override public function start():void
		{
			SocketConnection.addCmdListener(ViewOtherHeroModuleMessages.S2C_VIEW_OTHER_HERO_ONLINE,onLookRoleOnline);
			SocketConnection.addCmdListener(ViewOtherHeroModuleMessages.S2C_VIEW_OTHER_HERO_OFFLINE,onLookRoleOffline);
			SocketConnection.addCmdListener(ViewOtherHeroModuleMessages.S2C_VIEW_OTHER_HERO_FAIL,onLookFail);
			SocketConnection.addCmdListener(ViewOtherHeroModuleMessages.S2C_BEEN_VIEWED,onBeenViewed);
			finish();
		}
		
		/**
		 * 请求失败, 附带varint32的失败原因
		 *
		 * 1. id 不存在
		 * 2. 内部错误, 稍后再试
		 * 3. 对方服务器维护中
		 */
		private function onLookFail(buffer:ByteBuffer):void
		{
			var failID:int = buffer.readVarint32();
			NoticeManager.showNotify(LanguageConfig.getText(LangLook.LOOK_FAILED));
		}
		
		/**
		 * 附近有人正在上下打量你
		 *
		 * varint32 服务器id
		 * varint32 平台id
		 * bytes 观察你的人的名字
		 */
		private function onBeenViewed(buffer:ByteBuffer):void
		{
			var serverID:int = buffer.readVarint32();
			var platformID:int = buffer.readVarint32();
			var name:String = BytesUtil.readRemainUTF(buffer);
			NoticeManager.showNotify(LanguageConfig.getText(LangLook.BEEN_LOOKED,platformID,serverID,name));
		}
		
		/**
		 * 要查看的用户当前在线, 后面附带OtherHeroProto
		 */		
		private function onLookRoleOnline(buffer:ByteBuffer):void
		{
			onLookRoleOffline(buffer);
		}
		
		/**
		 * 要查看的用户当前不在线, 后面附带压缩过的OtherHeroProto. 灰掉组队之类不适合用在离线玩家身上的按钮
		 */
		private function onLookRoleOffline(buffer:ByteBuffer):void
		{
			TimerServer.delayCall(ReqLockUtil.unlockReq,1000,[ViewOtherHeroModuleMessages.C2S_VIEW_OTHER_HERO]);
			
			var role:OtherHeroProto = new OtherHeroProto();
			var bytes : ByteArray = new ByteArray();
			buffer.readBytes(bytes);
			bytes.uncompress();
			role.mergeFrom(bytes);
			
			LookManager.setRoleData(role);
			
			EventManager.dispatchEvent(LookEvent.ROLE_INFO);
			if(!AppManager.isAppInScene(AppConstant.LOOK_PANEL))
			{
				AppManager.showApp(AppConstant.LOOK_PANEL);
			}
		}
	}
}