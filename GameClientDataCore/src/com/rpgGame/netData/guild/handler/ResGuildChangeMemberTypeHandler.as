package com.rpgGame.netData.guild.handler{

	import com.rpgGame.netData.guild.message.ResGuildChangeMemberTypeMessage;
	import org.game.netCore.net.Handler;

	public class ResGuildChangeMemberTypeHandler extends Handler {
	
		public override function action(): void{
			var msg: ResGuildChangeMemberTypeMessage = ResGuildChangeMemberTypeMessage(this.message);
			//TODO 添加消息处理
		}
	}
}