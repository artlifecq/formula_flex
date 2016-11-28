package com.rpgGame.netData.client.handler{

	import com.rpgGame.netData.client.message.ResClientMessageMessage;
	import org.game.netCore.net.Handler;

	public class ResClientMessageHandler extends Handler {
	
		public override function action(): void{
			var msg: ResClientMessageMessage = ResClientMessageMessage(this.message);
			//TODO 添加消息处理
		}
	}
}