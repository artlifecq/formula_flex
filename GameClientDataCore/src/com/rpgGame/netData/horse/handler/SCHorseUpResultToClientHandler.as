package com.rpgGame.netData.horse.handler{

	import com.rpgGame.netData.horse.message.SCHorseUpResultToClientMessage;
	import org.game.netCore.net.Handler;

	public class SCHorseUpResultToClientHandler extends Handler {
	
		public override function action(): void{
			var msg: SCHorseUpResultToClientMessage = SCHorseUpResultToClientMessage(this.message);
			//TODO 添加消息处理
		}
	}
}