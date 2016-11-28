package com.rpgGame.netData.pet.handler{

	import com.rpgGame.netData.pet.message.ResPetTargetMessage;
	import org.game.netCore.net.Handler;

	public class ResPetTargetHandler extends Handler {
	
		public override function action(): void{
			var msg: ResPetTargetMessage = ResPetTargetMessage(this.message);
			//TODO 添加消息处理
		}
	}
}