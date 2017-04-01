package com.rpgGame.netData.horse.handler{

	import com.rpgGame.netData.horse.message.ResSendHorseInfoToClientMessage;
	import org.game.netCore.net.Handler;

	public class ResSendHorseInfoToClientHandler extends Handler {
	
		public override function action(): void{
			var msg: ResSendHorseInfoToClientMessage = ResSendHorseInfoToClientMessage(this.message);
			//TODO 添加消息处理
		}
	}
}