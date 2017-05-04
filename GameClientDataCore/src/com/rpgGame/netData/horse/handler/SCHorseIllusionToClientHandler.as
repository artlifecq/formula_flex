package com.rpgGame.netData.horse.handler{

	import com.rpgGame.netData.horse.message.SCHorseIllusionToClientMessage;
	import org.game.netCore.net.Handler;

	public class SCHorseIllusionToClientHandler extends Handler {
	
		public override function action(): void{
			var msg: SCHorseIllusionToClientMessage = SCHorseIllusionToClientMessage(this.message);
			//TODO 添加消息处理
		}
	}
}