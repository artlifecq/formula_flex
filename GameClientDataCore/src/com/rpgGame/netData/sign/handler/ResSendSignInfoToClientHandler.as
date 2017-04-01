package com.rpgGame.netData.sign.handler{

	import com.rpgGame.netData.sign.message.ResSendSignInfoToClientMessage;
	import org.game.netCore.net.Handler;

	public class ResSendSignInfoToClientHandler extends Handler {
	
		public override function action(): void{
			var msg: ResSendSignInfoToClientMessage = ResSendSignInfoToClientMessage(this.message);
			//TODO 添加消息处理
		}
	}
}