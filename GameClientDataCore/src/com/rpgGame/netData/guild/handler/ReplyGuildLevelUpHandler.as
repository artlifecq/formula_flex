package com.rpgGame.netData.guild.handler{

	import com.rpgGame.netData.guild.message.ReplyGuildLevelUpMessage;
	import org.game.netCore.net.Handler;

	public class ReplyGuildLevelUpHandler extends Handler {
	
		public override function action(): void{
			var msg: ReplyGuildLevelUpMessage = ReplyGuildLevelUpMessage(this.message);
			//TODO 添加消息处理
		}
	}
}