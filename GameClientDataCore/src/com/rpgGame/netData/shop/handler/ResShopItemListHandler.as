package com.rpgGame.netData.shop.handler{

	import com.rpgGame.netData.shop.message.ResShopItemListMessage;
	import org.game.netCore.net.Handler;

	public class ResShopItemListHandler extends Handler {
	
		public override function action(): void{
			var msg: ResShopItemListMessage = ResShopItemListMessage(this.message);
			//TODO 添加消息处理
		}
	}
}