package com.rpgGame.netData.yaota.handler{

	import com.rpgGame.netData.yaota.message.SCYaoTaLogMessage;
	import org.game.netCore.net.Handler;

	public class SCYaoTaLogHandler extends Handler {
	
		public override function action(): void{
			var msg: SCYaoTaLogMessage = SCYaoTaLogMessage(this.message);
			//TODO 添加消息处理
		}
	}
}