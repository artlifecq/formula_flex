package com.rpgGame.netData.sign.handler{

	import com.rpgGame.netData.sign.message.ResSendSignResultToClientMessage;
	import org.game.netCore.net.Handler;

	public class ResSendSignResultToClientHandler extends Handler {
	
		public override function action(): void{
			var msg: ResSendSignResultToClientMessage = ResSendSignResultToClientMessage(this.message);
			//TODO 添加消息处理
		}
	}
}