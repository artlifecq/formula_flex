package com.rpgGame.netData.dailyzone.handler{

	import com.rpgGame.netData.dailyzone.message.SCDailyZoneTimeInfoMessage;
	import org.game.netCore.net.Handler;

	public class SCDailyZoneTimeInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: SCDailyZoneTimeInfoMessage = SCDailyZoneTimeInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}