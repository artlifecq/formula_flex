package com.rpgGame.netData.yaota.handler{

	import com.rpgGame.netData.yaota.message.SCQuitYaoTaMessage;
	import org.game.netCore.net.Handler;

	public class SCQuitYaoTaHandler extends Handler {
	
		public override function action(): void{
			var msg: SCQuitYaoTaMessage = SCQuitYaoTaMessage(this.message);
			//TODO 添加消息处理
		}
	}
}