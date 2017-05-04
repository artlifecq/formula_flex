package com.rpgGame.app.cmdlistener.mount
{
	import com.rpgGame.app.manager.AvatarManager;
	import com.rpgGame.app.manager.mount.HorseManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.netData.horse.message.SCExtraItemNumMessage;
	import com.rpgGame.netData.horse.message.SCHorseAllInfoToClientMessage;
	import com.rpgGame.netData.horse.message.SCHorseIllusionToClientMessage;
	import com.rpgGame.netData.horse.message.SCHorseUpResultToClientMessage;
	
	import org.client.mainCore.bean.BaseBean;
	import org.game.netCore.connection.SocketConnection;
	
	public class MountCmdListener extends BaseBean
	{
		override public function start():void
		{
			SocketConnection.addCmdListener(144101, getSCHorseAllInfoToClientMessage);
			SocketConnection.addCmdListener(144103,getSCHorseIllusionToClientMessage);
			SocketConnection.addCmdListener(144105,getSCHorseUpResultToClientMessage);
			SocketConnection.addCmdListener(144106,getSCExtraItemNumMessage);
			super.finish();
		}
		
		private function getSCHorseAllInfoToClientMessage(msg:SCHorseAllInfoToClientMessage):void
		{
			HorseManager.instance().horsedataInfo = msg.horseDataInfo;
		}
		private function getSCHorseIllusionToClientMessage(msg:SCHorseIllusionToClientMessage):void
		{
			var role:SceneRole = SceneManager.getSceneObjByID(msg.playerId.ToGID()) as SceneRole;
			if (null == role || role.data ==null) {
				return;
			}
			var heroData : HeroData = role.data as HeroData; 
			heroData.mount = msg.horseModelid;
			AvatarManager.callEquipmentChange(role);
		}
		
		private function getSCHorseUpResultToClientMessage(msg:SCHorseUpResultToClientMessage):void
		{
			HorseManager.instance().uplevel(msg);
		}
		private function getSCExtraItemNumMessage(msg:SCExtraItemNumMessage):void
		{
			HorseManager.instance().updateExtraItemNum(msg);
		}
	}
}