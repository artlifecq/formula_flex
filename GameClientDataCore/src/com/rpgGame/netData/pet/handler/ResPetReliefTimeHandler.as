package com.rpgGame.netData.pet.handler{

	import com.rpgGame.netData.pet.message.ResPetReliefTimeMessage;
	import org.game.netCore.net.Handler;

	public class ResPetReliefTimeHandler extends Handler {
	
		public override function action(): void{
			var msg: ResPetReliefTimeMessage = ResPetReliefTimeMessage(this.message);
			//TODO 添加消息处理
		}
	}
}