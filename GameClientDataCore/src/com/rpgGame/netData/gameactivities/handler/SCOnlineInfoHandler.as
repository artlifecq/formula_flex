package com.rpgGame.netData.gameactivities.handler{

	import com.rpgGame.netData.gameactivities.message.SCOnlineInfoMessage;
	import org.game.netCore.net.Handler;

	public class SCOnlineInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: SCOnlineInfoMessage = SCOnlineInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}