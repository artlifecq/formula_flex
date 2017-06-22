package com.rpgGame.netData.daysdowngold.handler{

	import com.rpgGame.netData.daysdowngold.message.SCRankInfoMessage;
	import org.game.netCore.net.Handler;

	public class SCRankInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: SCRankInfoMessage = SCRankInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}