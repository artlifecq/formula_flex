package com.rpgGame.netData.dianfeng.handler{

	import com.rpgGame.netData.dianfeng.message.SCQuitRaceResultMessage;
	import org.game.netCore.net.Handler;

	public class SCQuitRaceResultHandler extends Handler {
	
		public override function action(): void{
			var msg: SCQuitRaceResultMessage = SCQuitRaceResultMessage(this.message);
			//TODO 添加消息处理
		}
	}
}