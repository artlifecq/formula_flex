package com.rpgGame.netData.fightsoul.handler{

	import com.rpgGame.netData.fightsoul.message.SCFightSoulRewardResultMessage;
	import org.game.netCore.net.Handler;

	public class SCFightSoulRewardResultHandler extends Handler {
	
		public override function action(): void{
			var msg: SCFightSoulRewardResultMessage = SCFightSoulRewardResultMessage(this.message);
			//TODO 添加消息处理
		}
	}
}