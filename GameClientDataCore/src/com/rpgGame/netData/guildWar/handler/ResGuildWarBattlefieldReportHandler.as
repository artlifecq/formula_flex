package com.rpgGame.netData.guildWar.handler{

	import com.rpgGame.netData.guildWar.message.ResGuildWarBattlefieldReportMessage;
	import org.game.netCore.net.Handler;

	public class ResGuildWarBattlefieldReportHandler extends Handler {
	
		public override function action(): void{
			var msg: ResGuildWarBattlefieldReportMessage = ResGuildWarBattlefieldReportMessage(this.message);
			//TODO 添加消息处理
		}
	}
}