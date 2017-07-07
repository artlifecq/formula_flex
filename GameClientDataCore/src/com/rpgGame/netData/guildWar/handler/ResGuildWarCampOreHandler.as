package com.rpgGame.netData.guildWar.handler{

	import com.rpgGame.netData.guildWar.message.ResGuildWarCampOreMessage;
	import org.game.netCore.net.Handler;

	public class ResGuildWarCampOreHandler extends Handler {
	
		public override function action(): void{
			var msg: ResGuildWarCampOreMessage = ResGuildWarCampOreMessage(this.message);
			//TODO 添加消息处理
		}
	}
}