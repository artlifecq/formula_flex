package com.rpgGame.netData.horse.handler{

	import com.rpgGame.netData.horse.message.SCHorseAllInfoToClientMessage;
	import org.game.netCore.net.Handler;

	public class SCHorseAllInfoToClientHandler extends Handler {
	
		public override function action(): void{
			var msg: SCHorseAllInfoToClientMessage = SCHorseAllInfoToClientMessage(this.message);
			//TODO 添加消息处理
		}
	}
}