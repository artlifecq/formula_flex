package com.rpgGame.netData.pet.handler{

	import com.rpgGame.netData.pet.message.ResPetRankChangeMessage;
	import org.game.netCore.net.Handler;

	public class ResPetRankChangeHandler extends Handler {
	
		public override function action(): void{
			var msg: ResPetRankChangeMessage = ResPetRankChangeMessage(this.message);
			//TODO 添加消息处理
		}
	}
}