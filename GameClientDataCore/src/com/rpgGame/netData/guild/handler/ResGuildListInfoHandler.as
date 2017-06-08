package com.rpgGame.netData.guild.handler{

	import com.rpgGame.netData.guild.message.ResGuildListInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResGuildListInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResGuildListInfoMessage = ResGuildListInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}