package com.rpgGame.netData.pvp.handler{

	import com.rpgGame.netData.pvp.message.SCRaceResultMessage;
	import org.game.netCore.net.Handler;

	public class SCRaceResultHandler extends Handler {
	
		public override function action(): void{
			var msg: SCRaceResultMessage = SCRaceResultMessage(this.message);
			//TODO 添加消息处理
		}
	}
}