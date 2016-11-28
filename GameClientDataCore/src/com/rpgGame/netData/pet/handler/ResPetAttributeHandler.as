package com.rpgGame.netData.pet.handler{

	import com.rpgGame.netData.pet.message.ResPetAttributeMessage;
	import org.game.netCore.net.Handler;

	public class ResPetAttributeHandler extends Handler {
	
		public override function action(): void{
			var msg: ResPetAttributeMessage = ResPetAttributeMessage(this.message);
			//TODO 添加消息处理
		}
	}
}