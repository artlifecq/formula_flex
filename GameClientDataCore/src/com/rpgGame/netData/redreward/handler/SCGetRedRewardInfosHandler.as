package com.rpgGame.netData.redreward.handler{

	import com.rpgGame.netData.redreward.message.SCGetRedRewardInfosMessage;
	import org.game.netCore.net.Handler;

	public class SCGetRedRewardInfosHandler extends Handler {
	
		public override function action(): void{
			var msg: SCGetRedRewardInfosMessage = SCGetRedRewardInfosMessage(this.message);
			//TODO 添加消息处理
		}
	}
}