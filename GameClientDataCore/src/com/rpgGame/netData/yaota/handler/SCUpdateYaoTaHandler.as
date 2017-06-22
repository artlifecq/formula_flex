package com.rpgGame.netData.yaota.handler{

	import com.rpgGame.netData.yaota.message.SCUpdateYaoTaMessage;
	import org.game.netCore.net.Handler;

	public class SCUpdateYaoTaHandler extends Handler {
	
		public override function action(): void{
			var msg: SCUpdateYaoTaMessage = SCUpdateYaoTaMessage(this.message);
			//TODO 添加消息处理
		}
	}
}