package com.rpgGame.netData.shop.handler{

	import com.rpgGame.netData.shop.message.SCBuyItemResultMessage;
	import org.game.netCore.net.Handler;

	public class SCBuyItemResultHandler extends Handler {
	
		public override function action(): void{
			var msg: SCBuyItemResultMessage = SCBuyItemResultMessage(this.message);
			//TODO 添加消息处理
		}
	}
}