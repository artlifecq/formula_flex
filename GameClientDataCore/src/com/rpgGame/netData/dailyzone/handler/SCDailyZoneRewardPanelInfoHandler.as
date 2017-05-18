package com.rpgGame.netData.dailyzone.handler{

	import com.rpgGame.netData.dailyzone.message.SCDailyZoneRewardPanelInfoMessage;
	import org.game.netCore.net.Handler;

	public class SCDailyZoneRewardPanelInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: SCDailyZoneRewardPanelInfoMessage = SCDailyZoneRewardPanelInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}