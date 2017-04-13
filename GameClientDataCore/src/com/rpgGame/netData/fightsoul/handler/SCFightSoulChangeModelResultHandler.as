package com.rpgGame.netData.fightsoul.handler{

	import com.rpgGame.netData.fightsoul.message.SCFightSoulChangeModelResultMessage;
	import org.game.netCore.net.Handler;

	public class SCFightSoulChangeModelResultHandler extends Handler {
	
		public override function action(): void{
			var msg: SCFightSoulChangeModelResultMessage = SCFightSoulChangeModelResultMessage(this.message);
			//TODO 添加消息处理
		}
	}
}