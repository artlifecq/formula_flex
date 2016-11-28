package com.rpgGame.netData.newactivities.handler{

	import com.rpgGame.netData.newactivities.message.ResNewGetRewardMessage;
	import org.game.netCore.net.Handler;

	public class ResNewGetRewardHandler extends Handler {
	
		public override function action(): void{
			var msg: ResNewGetRewardMessage = ResNewGetRewardMessage(this.message);
			//TODO 添加消息处理
		}
	}
}