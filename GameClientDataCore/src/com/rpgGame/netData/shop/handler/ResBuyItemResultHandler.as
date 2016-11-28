package com.rpgGame.netData.shop.handler{

	import com.rpgGame.netData.shop.message.ResBuyItemResultMessage;
	import org.game.netCore.net.Handler;

	public class ResBuyItemResultHandler extends Handler {
	
		public override function action(): void{
			var msg: ResBuyItemResultMessage = ResBuyItemResultMessage(this.message);
			//TODO 添加消息处理
		}
	}
}