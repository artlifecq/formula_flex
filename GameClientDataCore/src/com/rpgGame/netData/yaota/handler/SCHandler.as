package com.rpgGame.netData.yaota.handler{

	import com.rpgGame.netData.yaota.message.SCMessage;
	import org.game.netCore.net.Handler;

	public class SCHandler extends Handler {
	
		public override function action(): void{
			var msg: SCMessage = SCMessage(this.message);
			//TODO 添加消息处理
		}
	}
}