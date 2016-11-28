package com.rpgGame.netData.horse.handler{

	import com.rpgGame.netData.horse.message.ResHorseUpResultToClientMessage;
	import org.game.netCore.net.Handler;

	public class ResHorseUpResultToClientHandler extends Handler {
	
		public override function action(): void{
			var msg: ResHorseUpResultToClientMessage = ResHorseUpResultToClientMessage(this.message);
			//TODO 添加消息处理
		}
	}
}