package com.rpgGame.netData.mail.handler{

	import com.rpgGame.netData.mail.message.SCDeleteResultMessage;
	import org.game.netCore.net.Handler;

	public class SCDeleteResultHandler extends Handler {
	
		public override function action(): void{
			var msg: SCDeleteResultMessage = SCDeleteResultMessage(this.message);
			//TODO 添加消息处理
		}
	}
}