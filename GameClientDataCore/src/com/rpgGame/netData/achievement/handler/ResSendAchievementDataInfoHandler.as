package com.rpgGame.netData.achievement.handler{

	import com.rpgGame.netData.achievement.message.ResSendAchievementDataInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResSendAchievementDataInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResSendAchievementDataInfoMessage = ResSendAchievementDataInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}