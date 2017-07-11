package com.rpgGame.netData.marriage.handler{

	import com.rpgGame.netData.marriage.message.SCInteractionMessage;
	import org.game.netCore.net.Handler;

	public class SCInteractionHandler extends Handler {
	
		public override function action(): void{
			var msg: SCInteractionMessage = SCInteractionMessage(this.message);
			//TODO 添加消息处理
		}
	}
}