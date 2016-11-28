package com.rpgGame.netData.guild.handler{

	import com.rpgGame.netData.guild.message.ResGuildBossListMessage;
	import org.game.netCore.net.Handler;

	public class ResGuildBossListHandler extends Handler {
	
		public override function action(): void{
			var msg: ResGuildBossListMessage = ResGuildBossListMessage(this.message);
			//TODO 添加消息处理
		}
	}
}