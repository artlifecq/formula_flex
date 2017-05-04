package com.rpgGame.netData.cheats.handler{

	import com.rpgGame.netData.cheats.message.SCCheatsInfoMessage;
	import org.game.netCore.net.Handler;

	public class SCCheatsInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: SCCheatsInfoMessage = SCCheatsInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}