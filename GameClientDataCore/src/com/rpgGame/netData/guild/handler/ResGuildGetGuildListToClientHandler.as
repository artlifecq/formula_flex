package com.rpgGame.netData.guild.handler{

	import com.rpgGame.netData.guild.message.ResGuildGetGuildListToClientMessage;
	import org.game.netCore.net.Handler;

	public class ResGuildGetGuildListToClientHandler extends Handler {
	
		public override function action(): void{
			var msg: ResGuildGetGuildListToClientMessage = ResGuildGetGuildListToClientMessage(this.message);
			//TODO 添加消息处理
		}
	}
}