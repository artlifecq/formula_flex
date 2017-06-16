package com.rpgGame.netData.player.handler{

	import com.rpgGame.netData.player.message.SCNonagePromptMessage;
	import org.game.netCore.net.Handler;

	public class SCNonagePromptHandler extends Handler {
	
		public override function action(): void{
			var msg: SCNonagePromptMessage = SCNonagePromptMessage(this.message);
			//TODO 添加消息处理
		}
	}
}