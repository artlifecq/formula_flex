package com.rpgGame.netData.sign.handler{

	import com.rpgGame.netData.sign.message.ResSignSumAwardResultToClientMessage;
	import org.game.netCore.net.Handler;

	public class ResSignSumAwardResultToClientHandler extends Handler {
	
		public override function action(): void{
			var msg: ResSignSumAwardResultToClientMessage = ResSignSumAwardResultToClientMessage(this.message);
			//TODO 添加消息处理
		}
	}
}