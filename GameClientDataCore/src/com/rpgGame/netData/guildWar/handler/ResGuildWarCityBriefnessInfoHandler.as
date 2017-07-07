package com.rpgGame.netData.guildWar.handler{

	import com.rpgGame.netData.guildWar.message.ResGuildWarCityBriefnessInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResGuildWarCityBriefnessInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResGuildWarCityBriefnessInfoMessage = ResGuildWarCityBriefnessInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}