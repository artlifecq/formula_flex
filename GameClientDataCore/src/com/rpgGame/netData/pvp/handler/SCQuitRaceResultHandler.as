package com.rpgGame.netData.pvp.handler{

	import com.rpgGame.netData.pvp.message.SCQuitRaceResultMessage;
	import org.game.netCore.net.Handler;

	public class SCQuitRaceResultHandler extends Handler {
	
		public override function action(): void{
			var msg: SCQuitRaceResultMessage = SCQuitRaceResultMessage(this.message);
			//TODO 添加消息处理
		}
	}
}