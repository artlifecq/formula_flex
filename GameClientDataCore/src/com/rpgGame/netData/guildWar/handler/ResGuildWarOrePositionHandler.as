package com.rpgGame.netData.guildWar.handler{

	import com.rpgGame.netData.guildWar.message.ResGuildWarOrePositionMessage;
	import org.game.netCore.net.Handler;

	public class ResGuildWarOrePositionHandler extends Handler {
	
		public override function action(): void{
			var msg: ResGuildWarOrePositionMessage = ResGuildWarOrePositionMessage(this.message);
			//TODO 添加消息处理
		}
	}
}