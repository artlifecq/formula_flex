package com.rpgGame.netData.pet.handler{

	import com.rpgGame.netData.pet.message.ResPetZoneResultMessage;
	import org.game.netCore.net.Handler;

	public class ResPetZoneResultHandler extends Handler {
	
		public override function action(): void{
			var msg: ResPetZoneResultMessage = ResPetZoneResultMessage(this.message);
			//TODO 添加消息处理
		}
	}
}