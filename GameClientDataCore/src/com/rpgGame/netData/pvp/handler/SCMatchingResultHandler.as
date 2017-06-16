package com.rpgGame.netData.pvp.handler{

	import com.rpgGame.netData.pvp.message.SCMatchingResultMessage;
	import org.game.netCore.net.Handler;

	public class SCMatchingResultHandler extends Handler {
	
		public override function action(): void{
			var msg: SCMatchingResultMessage = SCMatchingResultMessage(this.message);
			//TODO 添加消息处理
		}
	}
}