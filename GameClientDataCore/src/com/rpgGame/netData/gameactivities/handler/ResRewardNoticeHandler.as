package com.rpgGame.netData.gameactivities.handler{

	import com.rpgGame.netData.gameactivities.message.ResRewardNoticeMessage;
	import org.game.netCore.net.Handler;

	public class ResRewardNoticeHandler extends Handler {
	
		public override function action(): void{
			var msg: ResRewardNoticeMessage = ResRewardNoticeMessage(this.message);
			//TODO 添加消息处理
		}
	}
}