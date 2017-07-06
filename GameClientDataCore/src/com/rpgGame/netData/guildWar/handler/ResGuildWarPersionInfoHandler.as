package com.rpgGame.netData.guildWar.handler{

	import com.rpgGame.netData.guildWar.message.ResGuildWarPersionInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResGuildWarPersionInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResGuildWarPersionInfoMessage = ResGuildWarPersionInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}