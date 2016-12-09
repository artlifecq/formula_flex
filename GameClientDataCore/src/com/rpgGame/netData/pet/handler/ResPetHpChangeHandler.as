package com.rpgGame.netData.pet.handler{

	import com.rpgGame.netData.pet.message.ResPetHpChangeMessage;
	import org.game.netCore.net.Handler;

	public class ResPetHpChangeHandler extends Handler {
	
		public override function action(): void{
			var msg: ResPetHpChangeMessage = ResPetHpChangeMessage(this.message);
			//TODO 添加消息处理
		}
	}
}