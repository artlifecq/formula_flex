package com.rpgGame.netData.player.handler{

	import com.rpgGame.netData.player.message.NonagePromptMessage;
	import org.game.netCore.net.Handler;

	public class NonagePromptHandler extends Handler {
	
		public override function action(): void{
			var msg: NonagePromptMessage = NonagePromptMessage(this.message);
			//TODO 添加消息处理
		}
	}
}