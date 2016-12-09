package com.rpgGame.netData.shop.handler{

	import com.rpgGame.netData.shop.message.ResRebuyItemInfosMessage;
	import org.game.netCore.net.Handler;

	public class ResRebuyItemInfosHandler extends Handler {
	
		public override function action(): void{
			var msg: ResRebuyItemInfosMessage = ResRebuyItemInfosMessage(this.message);
			//TODO 添加消息处理
		}
	}
}