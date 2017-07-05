package com.rpgGame.netData.guildWar.handler{

	import com.rpgGame.netData.guildWar.message.ResGuildWarPersonRankMessage;
	import org.game.netCore.net.Handler;

	public class ResGuildWarPersonRankHandler extends Handler {
	
		public override function action(): void{
			var msg: ResGuildWarPersonRankMessage = ResGuildWarPersonRankMessage(this.message);
			//TODO 添加消息处理
		}
	}
}