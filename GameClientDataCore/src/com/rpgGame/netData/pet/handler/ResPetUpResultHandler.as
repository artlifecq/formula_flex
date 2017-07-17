package com.rpgGame.netData.pet.handler{

	import com.rpgGame.netData.pet.message.ResPetUpResultMessage;
	import org.game.netCore.net.Handler;

	public class ResPetUpResultHandler extends Handler {
	
		public override function action(): void{
			var msg: ResPetUpResultMessage = ResPetUpResultMessage(this.message);
			//TODO 添加消息处理
		}
	}
}