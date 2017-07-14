package com.rpgGame.netData.pet.handler{

	import com.rpgGame.netData.pet.message.ResPetChangeMessage;
	import org.game.netCore.net.Handler;

	public class ResPetChangeHandler extends Handler {
	
		public override function action(): void{
			var msg: ResPetChangeMessage = ResPetChangeMessage(this.message);
			//TODO 添加消息处理
		}
	}
}