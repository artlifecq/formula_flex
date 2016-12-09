package com.rpgGame.netData.refining.handler{

	import com.rpgGame.netData.refining.message.ResExchangeResultMessage;
	import org.game.netCore.net.Handler;

	public class ResExchangeResultHandler extends Handler {
	
		public override function action(): void{
			var msg: ResExchangeResultMessage = ResExchangeResultMessage(this.message);
			//TODO 添加消息处理
		}
	}
}