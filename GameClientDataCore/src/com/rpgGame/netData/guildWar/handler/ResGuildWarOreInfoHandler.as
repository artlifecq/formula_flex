package com.rpgGame.netData.guildWar.handler{

	import com.rpgGame.netData.guildWar.message.ResGuildWarOreInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResGuildWarOreInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResGuildWarOreInfoMessage = ResGuildWarOreInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}