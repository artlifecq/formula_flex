package com.rpgGame.netData.shop.handler{

	import com.rpgGame.netData.shop.message.ResAuctionItemsMessage;
	import org.game.netCore.net.Handler;

	public class ResAuctionItemsHandler extends Handler {
	
		public override function action(): void{
			var msg: ResAuctionItemsMessage = ResAuctionItemsMessage(this.message);
			//TODO 添加消息处理
		}
	}
}