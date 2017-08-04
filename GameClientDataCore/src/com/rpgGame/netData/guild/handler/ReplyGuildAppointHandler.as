package com.rpgGame.netData.guild.handler{

	import com.rpgGame.netData.guild.message.ReplyGuildAppointMessage;
	import org.game.netCore.net.Handler;

	public class ReplyGuildAppointHandler extends Handler {
	
		public override function action(): void{
			var msg: ReplyGuildAppointMessage = ReplyGuildAppointMessage(this.message);
			//TODO 添加消息处理
		}
	}
}