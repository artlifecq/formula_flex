package com.rpgGame.netData.convoy.handler{

	import com.rpgGame.netData.convoy.message.SCConvoyFailureMessage;
	import org.game.netCore.net.Handler;

	public class SCConvoyFailureHandler extends Handler {
	
		public override function action(): void{
			var msg: SCConvoyFailureMessage = SCConvoyFailureMessage(this.message);
			//TODO 添加消息处理
		}
	}
}