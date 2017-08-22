package com.client.process
{
	import com.client.sender.LoginSender;
	import com.game.engine3D.process.BaseProcess;
	import com.gameClient.utils.RandomNick;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.netData.player.bean.MyPlayerInfo;
	import com.rpgGame.netData.player.message.ResChangePlayerNameToClientMessage;
	
	import org.client.mainCore.manager.EventManager;
	
	/**
	 *随机改名
	 * @author dik
	 * 
	 */
	public class RandomChangeName extends BaseProcess
	{
		public function RandomChangeName()
		{
			super();
		}
		
		override public function getState() : String
		{
			return ProcessState.STATE_RANDOM_NAME;
		}
		
		override public function startProcess() : void
		{
			super.startProcess();
			if(ClientConfig.isRelease){
				var oldName:String= ClientConfig.loginData.name;
				var index:int=oldName.indexOf("]");
				oldName=oldName.substring(index+1);
				if(oldName!=ClientConfig.loginName){
					EventManager.addEvent(CharAttributeType.CHANGE_NAME,getChangeName);
					randomName();
					return;
				}
			}
			completeProcess();
		}
		
		private function randomName():void
		{
			var info:MyPlayerInfo=ClientConfig.loginData;
			var newname:String=RandomNick.randomNick(info.sex==1);
			LoginSender.reqLoginChangeName(newname);			
		}
		
		private function getChangeName(msg:ResChangePlayerNameToClientMessage):void
		{
			if(msg.result==1){
				ClientConfig.loginData.name=msg.newname;
				EventManager.removeEvent(CharAttributeType.CHANGE_NAME,getChangeName);
				completeProcess();
			}else{
				randomName();
			}
		}
	}
}