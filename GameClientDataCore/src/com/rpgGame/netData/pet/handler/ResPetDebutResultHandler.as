package com.rpgGame.netData.pet.handler{

	import com.rpgGame.netData.pet.message.ResPetDebutResultMessage;
	import org.game.netCore.net.Handler;

	public class ResPetDebutResultHandler extends Handler {
	
		public override function action(): void{
			var msg: ResPetDebutResultMessage = ResPetDebutResultMessage(this.message);
			//TODO 添加消息处理
		}
	}
}