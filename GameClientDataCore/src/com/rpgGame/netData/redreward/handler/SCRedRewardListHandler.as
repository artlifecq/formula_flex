package com.rpgGame.netData.redreward.handler{

	import com.rpgGame.netData.redreward.message.SCRedRewardListMessage;
	import org.game.netCore.net.Handler;

	public class SCRedRewardListHandler extends Handler {
	
		public override function action(): void{
			var msg: SCRedRewardListMessage = SCRedRewardListMessage(this.message);
			//TODO 添加消息处理
		}
	}
}