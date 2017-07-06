package com.rpgGame.netData.redreward.handler{

	import com.rpgGame.netData.redreward.message.SCGetRedRewardLogMessage;
	import org.game.netCore.net.Handler;

	public class SCGetRedRewardLogHandler extends Handler {
	
		public override function action(): void{
			var msg: SCGetRedRewardLogMessage = SCGetRedRewardLogMessage(this.message);
			//TODO 添加消息处理
		}
	}
}