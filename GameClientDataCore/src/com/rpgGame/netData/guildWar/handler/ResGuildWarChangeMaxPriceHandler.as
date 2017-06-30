package com.rpgGame.netData.guildWar.handler{

	import com.rpgGame.netData.guildWar.message.ResGuildWarChangeMaxPriceMessage;
	import org.game.netCore.net.Handler;

	public class ResGuildWarChangeMaxPriceHandler extends Handler {
	
		public override function action(): void{
			var msg: ResGuildWarChangeMaxPriceMessage = ResGuildWarChangeMaxPriceMessage(this.message);
			//TODO 添加消息处理
		}
	}
}