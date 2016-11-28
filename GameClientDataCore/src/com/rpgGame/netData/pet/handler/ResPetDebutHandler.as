package com.rpgGame.netData.pet.handler{

	import com.rpgGame.netData.pet.message.ResPetDebutMessage;
	import org.game.netCore.net.Handler;

	public class ResPetDebutHandler extends Handler {
	
		public override function action(): void{
			var msg: ResPetDebutMessage = ResPetDebutMessage(this.message);
			//TODO 添加消息处理
		}
	}
}