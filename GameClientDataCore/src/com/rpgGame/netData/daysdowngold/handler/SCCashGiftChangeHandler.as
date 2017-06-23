package com.rpgGame.netData.daysdowngold.handler{

	import com.rpgGame.netData.daysdowngold.message.SCCashGiftChangeMessage;
	import org.game.netCore.net.Handler;

	public class SCCashGiftChangeHandler extends Handler {
	
		public override function action(): void{
			var msg: SCCashGiftChangeMessage = SCCashGiftChangeMessage(this.message);
			//TODO 添加消息处理
		}
	}
}