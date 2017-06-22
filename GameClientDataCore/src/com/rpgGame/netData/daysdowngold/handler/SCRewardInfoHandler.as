package com.rpgGame.netData.daysdowngold.handler{

	import com.rpgGame.netData.daysdowngold.message.SCRewardInfoMessage;
	import org.game.netCore.net.Handler;

	public class SCRewardInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: SCRewardInfoMessage = SCRewardInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}