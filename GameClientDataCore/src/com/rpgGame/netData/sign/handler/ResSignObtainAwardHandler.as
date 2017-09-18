package com.rpgGame.netData.sign.handler{

	import com.rpgGame.netData.sign.message.ResSignObtainAwardMessage;
	import org.game.netCore.net.Handler;

	public class ResSignObtainAwardHandler extends Handler {
	
		public override function action(): void{
			var msg: ResSignObtainAwardMessage = ResSignObtainAwardMessage(this.message);
			//TODO 添加消息处理
		}
	}
}