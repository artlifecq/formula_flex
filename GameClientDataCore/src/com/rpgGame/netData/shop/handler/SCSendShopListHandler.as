package com.rpgGame.netData.shop.handler{

	import com.rpgGame.netData.shop.message.SCSendShopListMessage;
	import org.game.netCore.net.Handler;

	public class SCSendShopListHandler extends Handler {
	
		public override function action(): void{
			var msg: SCSendShopListMessage = SCSendShopListMessage(this.message);
			//TODO 添加消息处理
		}
	}
}