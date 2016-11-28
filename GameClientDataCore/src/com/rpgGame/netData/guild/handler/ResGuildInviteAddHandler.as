package com.rpgGame.netData.guild.handler{

	import com.rpgGame.netData.guild.message.ResGuildInviteAddMessage;
	import org.game.netCore.net.Handler;

	public class ResGuildInviteAddHandler extends Handler {
	
		public override function action(): void{
			var msg: ResGuildInviteAddMessage = ResGuildInviteAddMessage(this.message);
			//TODO 添加消息处理
		}
	}
}