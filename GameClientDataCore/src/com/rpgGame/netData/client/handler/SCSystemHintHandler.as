package com.rpgGame.netData.client.handler{

	import com.rpgGame.netData.client.message.SCSystemHintMessage;
	import org.game.netCore.net.Handler;

	public class SCSystemHintHandler extends Handler {
	
		public override function action(): void{
			var msg: SCSystemHintMessage = SCSystemHintMessage(this.message);
			//TODO 添加消息处理
		}
	}
}