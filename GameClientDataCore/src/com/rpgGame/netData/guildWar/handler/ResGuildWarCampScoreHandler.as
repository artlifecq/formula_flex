package com.rpgGame.netData.guildWar.handler{

	import com.rpgGame.netData.guildWar.message.ResGuildWarCampScoreMessage;
	import org.game.netCore.net.Handler;

	public class ResGuildWarCampScoreHandler extends Handler {
	
		public override function action(): void{
			var msg: ResGuildWarCampScoreMessage = ResGuildWarCampScoreMessage(this.message);
			//TODO 添加消息处理
		}
	}
}