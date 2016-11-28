package com.rpgGame.netData.horse.handler{

	import com.rpgGame.netData.horse.message.ResHorseIllusionToClientMessage;
	import org.game.netCore.net.Handler;

	public class ResHorseIllusionToClientHandler extends Handler {
	
		public override function action(): void{
			var msg: ResHorseIllusionToClientMessage = ResHorseIllusionToClientMessage(this.message);
			//TODO 添加消息处理
		}
	}
}