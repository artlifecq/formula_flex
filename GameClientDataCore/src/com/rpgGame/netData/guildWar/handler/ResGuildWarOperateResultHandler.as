package com.rpgGame.netData.guildWar.handler{

	import com.rpgGame.netData.guildWar.message.ResGuildWarOperateResultMessage;
	import org.game.netCore.net.Handler;

	public class ResGuildWarOperateResultHandler extends Handler {
	
		public override function action(): void{
			var msg: ResGuildWarOperateResultMessage = ResGuildWarOperateResultMessage(this.message);
			//TODO 添加消息处理
		}
	}
}