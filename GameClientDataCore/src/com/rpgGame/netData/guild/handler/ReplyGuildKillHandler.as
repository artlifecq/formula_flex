package com.rpgGame.netData.guild.handler{

	import com.rpgGame.netData.guild.message.ReplyGuildKillMessage;
	import org.game.netCore.net.Handler;

	public class ReplyGuildKillHandler extends Handler {
	
		public override function action(): void{
			var msg: ReplyGuildKillMessage = ReplyGuildKillMessage(this.message);
			//TODO 添加消息处理
		}
	}
}