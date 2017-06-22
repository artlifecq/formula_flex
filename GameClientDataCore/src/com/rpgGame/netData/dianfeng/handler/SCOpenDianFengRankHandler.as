package com.rpgGame.netData.dianfeng.handler{

	import com.rpgGame.netData.dianfeng.message.SCOpenDianFengRankMessage;
	import org.game.netCore.net.Handler;

	public class SCOpenDianFengRankHandler extends Handler {
	
		public override function action(): void{
			var msg: SCOpenDianFengRankMessage = SCOpenDianFengRankMessage(this.message);
			//TODO 添加消息处理
		}
	}
}