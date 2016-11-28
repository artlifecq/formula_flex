package com.rpgGame.netData.horse.handler{

	import com.rpgGame.netData.horse.message.ResSendHorseAllInfoToClientMessage;
	import org.game.netCore.net.Handler;

	public class ResSendHorseAllInfoToClientHandler extends Handler {
	
		public override function action(): void{
			var msg: ResSendHorseAllInfoToClientMessage = ResSendHorseAllInfoToClientMessage(this.message);
			//TODO 添加消息处理
		}
	}
}