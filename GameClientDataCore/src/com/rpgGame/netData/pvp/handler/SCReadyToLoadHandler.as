package com.rpgGame.netData.pvp.handler{

	import com.rpgGame.netData.pvp.message.SCReadyToLoadMessage;
	import org.game.netCore.net.Handler;

	public class SCReadyToLoadHandler extends Handler {
	
		public override function action(): void{
			var msg: SCReadyToLoadMessage = SCReadyToLoadMessage(this.message);
			//TODO 添加消息处理
		}
	}
}