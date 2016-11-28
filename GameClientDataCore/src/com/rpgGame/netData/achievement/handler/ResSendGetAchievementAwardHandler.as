package com.rpgGame.netData.achievement.handler{

	import com.rpgGame.netData.achievement.message.ResSendGetAchievementAwardMessage;
	import org.game.netCore.net.Handler;

	public class ResSendGetAchievementAwardHandler extends Handler {
	
		public override function action(): void{
			var msg: ResSendGetAchievementAwardMessage = ResSendGetAchievementAwardMessage(this.message);
			//TODO 添加消息处理
		}
	}
}