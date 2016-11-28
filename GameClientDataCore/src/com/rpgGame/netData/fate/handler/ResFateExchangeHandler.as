package com.rpgGame.netData.fate.handler{

	import com.rpgGame.netData.fate.message.ResFateExchangeMessage;
	import org.game.netCore.net.Handler;

	public class ResFateExchangeHandler extends Handler {
	
		public override function action(): void{
			var msg: ResFateExchangeMessage = ResFateExchangeMessage(this.message);
			//TODO 添加消息处理
		}
	}
}