package com.rpgGame.netData.gameactivities.handler{

	import com.rpgGame.netData.gameactivities.message.SCOnlineRewardMessage;
	import org.game.netCore.net.Handler;

	public class SCOnlineRewardHandler extends Handler {
	
		public override function action(): void{
			var msg: SCOnlineRewardMessage = SCOnlineRewardMessage(this.message);
			//TODO 添加消息处理
		}
	}
}