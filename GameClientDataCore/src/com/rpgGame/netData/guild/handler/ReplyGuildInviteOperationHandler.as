package com.rpgGame.netData.guild.handler{

	import com.rpgGame.netData.guild.message.ReplyGuildInviteOperationMessage;
	import org.game.netCore.net.Handler;

	public class ReplyGuildInviteOperationHandler extends Handler {
	
		public override function action(): void{
			var msg: ReplyGuildInviteOperationMessage = ReplyGuildInviteOperationMessage(this.message);
			//TODO 添加消息处理
		}
	}
}