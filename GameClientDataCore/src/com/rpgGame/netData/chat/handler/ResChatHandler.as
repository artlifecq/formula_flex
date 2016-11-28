package com.rpgGame.netData.chat.handler{

	import com.rpgGame.netData.chat.message.ResChatMessage;
	import org.game.netCore.net.Handler;

	public class ResChatHandler extends Handler {
	
		public override function action(): void{
			var msg: ResChatMessage = ResChatMessage(this.message);
			//TODO 添加消息处理
		}
	}
}