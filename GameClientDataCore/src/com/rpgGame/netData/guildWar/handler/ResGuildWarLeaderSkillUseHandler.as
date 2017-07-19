package com.rpgGame.netData.guildWar.handler{

	import com.rpgGame.netData.guildWar.message.ResGuildWarLeaderSkillUseMessage;
	import org.game.netCore.net.Handler;

	public class ResGuildWarLeaderSkillUseHandler extends Handler {
	
		public override function action(): void{
			var msg: ResGuildWarLeaderSkillUseMessage = ResGuildWarLeaderSkillUseMessage(this.message);
			//TODO 添加消息处理
		}
	}
}