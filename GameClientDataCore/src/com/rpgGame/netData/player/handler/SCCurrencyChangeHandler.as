package com.rpgGame.netData.player.handler{

	import com.rpgGame.netData.player.message.SCCurrencyChangeMessage;
	import org.game.netCore.net.Handler;

	public class SCCurrencyChangeHandler extends Handler {
	
		public override function action(): void{
			var msg: SCCurrencyChangeMessage = SCCurrencyChangeMessage(this.message);
			//TODO 添加消息处理
		}
	}
}