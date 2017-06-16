package com.rpgGame.netData.pvp.handler{

	import com.rpgGame.netData.pvp.message.SCOpenDianFengRankMessage;
	import org.game.netCore.net.Handler;

	public class SCOpenDianFengRankHandler extends Handler {
	
		public override function action(): void{
			var msg: SCOpenDianFengRankMessage = SCOpenDianFengRankMessage(this.message);
			//TODO 添加消息处理
		}
	}
}