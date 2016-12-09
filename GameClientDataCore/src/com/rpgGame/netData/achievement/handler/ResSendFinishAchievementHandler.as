package com.rpgGame.netData.achievement.handler{

	import com.rpgGame.netData.achievement.message.ResSendFinishAchievementMessage;
	import org.game.netCore.net.Handler;

	public class ResSendFinishAchievementHandler extends Handler {
	
		public override function action(): void{
			var msg: ResSendFinishAchievementMessage = ResSendFinishAchievementMessage(this.message);
			//TODO 添加消息处理
		}
	}
}