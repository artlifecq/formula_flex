package com.rpgGame.netData.daysdowngold.handler{

	import com.rpgGame.netData.daysdowngold.message.SCCashGiftClientMessage;
	import org.game.netCore.net.Handler;

	public class SCCashGiftClientHandler extends Handler {
	
		public override function action(): void{
			var msg: SCCashGiftClientMessage = SCCashGiftClientMessage(this.message);
			//TODO 添加消息处理
		}
	}
}