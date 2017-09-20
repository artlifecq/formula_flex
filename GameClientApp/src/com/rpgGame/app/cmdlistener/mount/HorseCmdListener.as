package com.rpgGame.app.cmdlistener.mount
{
	import com.rpgGame.app.manager.mount.HorseManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.netData.horse.message.SCExtraItemNumMessage;
	import com.rpgGame.netData.horse.message.SCHorseAllInfoToClientMessage;
	import com.rpgGame.netData.horse.message.SCHorseIllusionToClientMessage;
	import com.rpgGame.netData.horse.message.SCHorseUpResultToClientMessage;
	
	import org.client.mainCore.bean.BaseBean;
	import org.game.netCore.connection.SocketConnection;
	
	public class HorseCmdListener extends BaseBean
	{
		override public function start():void
		{
			SocketConnection.addCmdListener(144101, getSCHorseAllInfoToClientMessage);
			SocketConnection.addCmdListener(144103,getSCHorseIllusionToClientMessage);
			SocketConnection.addCmdListener(144105,getSCHorseUpResultToClientMessage);
			SocketConnection.addCmdListener(144106,getSCExtraItemNumMessage);
			super.finish();
		}
		
		/**
		 * 拉取坐骑信息，初始化的时候，幻化成功。发过来 
		 * @param msg
		 * 
		 */		
		private function getSCHorseAllInfoToClientMessage(msg:SCHorseAllInfoToClientMessage):void
		{
			HorseManager.instance().horsedataInfo = msg.horseDataInfo;
		}
		
		/**
		 * 上下坐骑的协议 
		 * @param msg
		 * 
		 */		
		private function getSCHorseIllusionToClientMessage(msg:SCHorseIllusionToClientMessage):void
		{
			var role:SceneRole = SceneManager.getSceneObjByID(msg.playerId) as SceneRole;
			if (null == role || role.data ==null) {
				return;
			}
			role.updateMount(msg.horseModelid);
		}
		
		/**
		 * 坐骑升级 
		 * @param msg
		 * 
		 */		
		private function getSCHorseUpResultToClientMessage(msg:SCHorseUpResultToClientMessage):void
		{
			HorseManager.instance().uplevel(msg);
		}
		
		/**
		 * 吃坐骑丹的时候过来
		 * @param msg
		 * 
		 */		
		private function getSCExtraItemNumMessage(msg:SCExtraItemNumMessage):void
		{
			HorseManager.instance().updateExtraItemNum(msg);
		}
	}
}