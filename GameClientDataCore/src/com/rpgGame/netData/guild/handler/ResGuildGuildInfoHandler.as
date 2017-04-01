package com.rpgGame.netData.guild.handler{

	import com.rpgGame.netData.guild.message.ResGuildGuildInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResGuildGuildInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResGuildGuildInfoMessage = ResGuildGuildInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}