package com.rpgGame.netData.guild.handler{

	import com.rpgGame.netData.guild.message.ResDevoteGuildMessage;
	import org.game.netCore.net.Handler;

	public class ResDevoteGuildHandler extends Handler {
	
		public override function action(): void{
			var msg: ResDevoteGuildMessage = ResDevoteGuildMessage(this.message);
			//TODO 添加消息处理
		}
	}
}