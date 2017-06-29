package com.rpgGame.netData.guildWar.handler{

	import com.rpgGame.netData.guildWar.message.ResGuildWarCityInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResGuildWarCityInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResGuildWarCityInfoMessage = ResGuildWarCityInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}