package com.rpgGame.netData.dailyzone.handler{

	import com.rpgGame.netData.dailyzone.message.SCDailyZoneIdInfoMessage;
	import org.game.netCore.net.Handler;

	public class SCDailyZoneIdInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: SCDailyZoneIdInfoMessage = SCDailyZoneIdInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}