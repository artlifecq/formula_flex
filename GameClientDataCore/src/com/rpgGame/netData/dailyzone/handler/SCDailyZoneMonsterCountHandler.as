package com.rpgGame.netData.dailyzone.handler{

	import com.rpgGame.netData.dailyzone.message.SCDailyZoneMonsterCountMessage;
	import org.game.netCore.net.Handler;

	public class SCDailyZoneMonsterCountHandler extends Handler {
	
		public override function action(): void{
			var msg: SCDailyZoneMonsterCountMessage = SCDailyZoneMonsterCountMessage(this.message);
			//TODO 添加消息处理
		}
	}
}