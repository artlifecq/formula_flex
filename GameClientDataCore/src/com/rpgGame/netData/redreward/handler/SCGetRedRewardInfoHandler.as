package com.rpgGame.netData.redreward.handler{

	import com.rpgGame.netData.redreward.message.SCGetRedRewardInfoMessage;
	import org.game.netCore.net.Handler;

	public class SCGetRedRewardInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: SCGetRedRewardInfoMessage = SCGetRedRewardInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}