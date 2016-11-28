package com.rpgGame.netData.activities.handler{

	import com.rpgGame.netData.activities.message.ResActivitiesGetRewardInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResActivitiesGetRewardInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResActivitiesGetRewardInfoMessage = ResActivitiesGetRewardInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}