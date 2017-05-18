package com.rpgGame.netData.shop.handler{

	import com.rpgGame.netData.shop.message.SCRebuyItemInfosMessage;
	import org.game.netCore.net.Handler;

	public class SCRebuyItemInfosHandler extends Handler {
	
		public override function action(): void{
			var msg: SCRebuyItemInfosMessage = SCRebuyItemInfosMessage(this.message);
			//TODO 添加消息处理
		}
	}
}