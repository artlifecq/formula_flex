package com.rpgGame.app.cmdlistener
{
	import com.gameClient.log.GameLog;
	import com.rpgGame.app.manager.BuffCdManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.coreData.info.buff.BuffData;
	import com.rpgGame.netData.buff.message.ResAddBuffMessage;
	import com.rpgGame.netData.buff.message.ResBuffInfoMessage;
	import com.rpgGame.netData.buff.message.ResBuffsMessage;
	import com.rpgGame.netData.buff.message.ResChangeBuffMessage;
	import com.rpgGame.netData.buff.message.ResRemoveBuffMessage;
	import com.rpgGame.netData.buff.message.ResShowBuffInfoMessage;
	
	import org.client.mainCore.bean.BaseBean;
	import org.game.netCore.connection.SocketConnection;

	public class BuffCmdListener extends BaseBean
	{
		public function BuffCmdListener()
		{
			super();
		}
		
		override public function start() : void
		{
			SocketConnection.addCmdListener(121102,onResAddBuffMessage);
			SocketConnection.addCmdListener(121104,onResBuffInfoMessage);
			SocketConnection.addCmdListener(121101,onResBuffsMessage);
			SocketConnection.addCmdListener(121105,onResChangeBuffMessage);
			SocketConnection.addCmdListener(121103,onResRemoveBuffMessage);
			SocketConnection.addCmdListener(121106,onResShowBuffInfoMessage);
			
			finish();
		}
		
		private function onResShowBuffInfoMessage(msg:ResShowBuffInfoMessage):void
		{
			
		}
		
		private function onResRemoveBuffMessage(msg:ResRemoveBuffMessage):void
		{
			var tarObj :SceneRole = SceneManager.getSceneObjByID(msg.personId.ToGID()) as SceneRole;
			if (tarObj != null)
			{
				tarObj.buffSet.removeBuffByBuffID( msg.buffId.ToGID());
				GameLog.addShow("*************************删除一条buff，buffID为： \t" + msg.buffId.ToGID());
			}
		}
		
		
		private function onResChangeBuffMessage(msg:ResChangeBuffMessage):void
		{
			
		}
		
		/**
		 * 同步主玩家全部BUFF 
		 * @param msg
		 */
		private function onResBuffsMessage(msg:ResBuffsMessage):void
		{
			
		}
		
		private function onResBuffInfoMessage(msg:ResBuffInfoMessage):void
		{
			if (MainRoleManager.actor == null)
				return; 
			
//			var buffData:BuffData = MainRoleManager.actor.buffSet.getBuffData(msg.buffId);
//			if (buffData != null)
//			{
//				vo.SetTime(msg.remain, vo.buffi.totalTime);
//				vo.buffi.value = msg.value;
//				AddBuff(vo, Mgr.mainPlayer, null);
//			}
		}
		
		private function onResAddBuffMessage(msg:ResAddBuffMessage):void
		{
			var tarObj :SceneRole = SceneManager.getSceneObjByID(msg.personId.ToGID()) as SceneRole;
			var srcObj :SceneRole = SceneManager.getSceneObjByID(msg.sourceId.ToGID()) as SceneRole;
			if (tarObj != null)
			{
//				tarObj.SetFightState(msg.fightState);
				var buffData:BuffData = new BuffData(msg.personId.ToGID());
				buffData.buffInfo = msg.buff;
				buffData.srcRole = srcObj;
				tarObj.buffSet.addBuff(buffData);
				BuffCdManager.playBuffCd(buffData);
				
				GameLog.addShow("*************************增加一条buff，buffID为： \t" + msg.buff.buffId.ToGID());
			}
		}
	}
}