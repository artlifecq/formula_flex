package com.rpgGame.netData.dianfeng.handler{

	import com.rpgGame.netData.dianfeng.message.SCRaceResultMessage;
	import org.game.netCore.net.Handler;

	public class SCRaceResultHandler extends Handler {
	
		public override function action(): void{
			var msg: SCRaceResultMessage = SCRaceResultMessage(this.message);
			//TODO 添加消息处理
		}
	}
}