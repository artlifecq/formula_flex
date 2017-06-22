package com.rpgGame.netData.yaota.handler{

	import com.rpgGame.netData.yaota.message.SCEnterYaoTaResultMessage;
	import org.game.netCore.net.Handler;

	public class SCEnterYaoTaResultHandler extends Handler {
	
		public override function action(): void{
			var msg: SCEnterYaoTaResultMessage = SCEnterYaoTaResultMessage(this.message);
			//TODO 添加消息处理
		}
	}
}