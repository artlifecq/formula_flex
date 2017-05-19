package com.rpgGame.netData.shop.handler{

	import com.rpgGame.netData.shop.message.SCSendShopItemChangeMessage;
	import org.game.netCore.net.Handler;

	public class SCSendShopItemChangeHandler extends Handler {
	
		public override function action(): void{
			var msg: SCSendShopItemChangeMessage = SCSendShopItemChangeMessage(this.message);
			//TODO 添加消息处理
		}
	}
}