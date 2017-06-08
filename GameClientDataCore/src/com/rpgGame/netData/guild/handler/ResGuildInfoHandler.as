package com.rpgGame.netData.guild.handler{

	import com.rpgGame.netData.guild.message.ResGuildInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResGuildInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResGuildInfoMessage = ResGuildInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}