package com.rpgGame.netData.guildWar.handler{

	import com.rpgGame.netData.guildWar.message.ResGuildWarResultMessage;
	import org.game.netCore.net.Handler;

	public class ResGuildWarResultHandler extends Handler {
	
		public override function action(): void{
			var msg: ResGuildWarResultMessage = ResGuildWarResultMessage(this.message);
			//TODO 添加消息处理
		}
	}
}