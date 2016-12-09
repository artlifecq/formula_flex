package com.rpgGame.netData.pet.handler{

	import com.rpgGame.netData.pet.message.ResPetDieBroadcastMessage;
	import org.game.netCore.net.Handler;

	public class ResPetDieBroadcastHandler extends Handler {
	
		public override function action(): void{
			var msg: ResPetDieBroadcastMessage = ResPetDieBroadcastMessage(this.message);
			//TODO 添加消息处理
		}
	}
}