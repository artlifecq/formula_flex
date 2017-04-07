package com.rpgGame.netData.fightsoul.handler{

	import com.rpgGame.netData.fightsoul.message.SCFightSoulDatasMessage;
	import org.game.netCore.net.Handler;

	public class SCFightSoulDatasHandler extends Handler {
	
		public override function action(): void{
			var msg: SCFightSoulDatasMessage = SCFightSoulDatasMessage(this.message);
			//TODO 添加消息处理
		}
	}
}