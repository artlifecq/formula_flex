package com.rpgGame.netData.treasurehunt.handler{

	import com.rpgGame.netData.treasurehunt.message.ResHuntRewardInfosMessage;
	import org.game.netCore.net.Handler;

	public class ResHuntRewardInfosHandler extends Handler {
	
		public override function action(): void{
			var msg: ResHuntRewardInfosMessage = ResHuntRewardInfosMessage(this.message);
			//TODO 添加消息处理
		}
	}
}