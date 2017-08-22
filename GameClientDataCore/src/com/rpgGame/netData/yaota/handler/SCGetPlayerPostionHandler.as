package com.rpgGame.netData.yaota.handler{

	import com.rpgGame.netData.yaota.message.SCGetPlayerPostionMessage;
	import org.game.netCore.net.Handler;

	public class SCGetPlayerPostionHandler extends Handler {
	
		public override function action(): void{
			var msg: SCGetPlayerPostionMessage = SCGetPlayerPostionMessage(this.message);
			//TODO 添加消息处理
		}
	}
}