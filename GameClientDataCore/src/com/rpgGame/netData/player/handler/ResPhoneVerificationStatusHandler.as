package com.rpgGame.netData.player.handler{

	import com.rpgGame.netData.player.message.ResPhoneVerificationStatusMessage;
	import org.game.netCore.net.Handler;

	public class ResPhoneVerificationStatusHandler extends Handler {
	
		public override function action(): void{
			var msg: ResPhoneVerificationStatusMessage = ResPhoneVerificationStatusMessage(this.message);
			//TODO 添加消息处理
		}
	}
}