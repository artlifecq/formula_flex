package com.rpgGame.netData.dailyzone.handler{

	import com.rpgGame.netData.dailyzone.message.SCDailyZonePanelInfoMessage;
	import org.game.netCore.net.Handler;

	public class SCDailyZonePanelInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: SCDailyZonePanelInfoMessage = SCDailyZonePanelInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}