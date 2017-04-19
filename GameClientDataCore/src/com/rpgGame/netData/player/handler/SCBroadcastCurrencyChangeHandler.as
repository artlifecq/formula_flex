package com.rpgGame.netData.player.handler{

	import com.rpgGame.netData.player.message.SCBroadcastCurrencyChangeMessage;
	import org.game.netCore.net.Handler;

	public class SCBroadcastCurrencyChangeHandler extends Handler {
	
		public override function action(): void{
			var msg: SCBroadcastCurrencyChangeMessage = SCBroadcastCurrencyChangeMessage(this.message);
			//TODO 添加消息处理
		}
	}
}