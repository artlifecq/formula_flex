package com.rpgGame.netData.pet.handler{

	import com.rpgGame.netData.pet.message.ResPetListMessage;
	import org.game.netCore.net.Handler;

	public class ResPetListHandler extends Handler {
	
		public override function action(): void{
			var msg: ResPetListMessage = ResPetListMessage(this.message);
			//TODO 添加消息处理
		}
	}
}