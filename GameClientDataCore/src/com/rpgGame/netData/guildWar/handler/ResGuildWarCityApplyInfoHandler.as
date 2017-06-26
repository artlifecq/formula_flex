package com.rpgGame.netData.guildWar.handler{

	import com.rpgGame.netData.guildWar.message.ResGuildWarCityApplyInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResGuildWarCityApplyInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResGuildWarCityApplyInfoMessage = ResGuildWarCityApplyInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}