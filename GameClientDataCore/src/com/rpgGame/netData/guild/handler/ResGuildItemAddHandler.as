package com.rpgGame.netData.guild.handler{

	import com.rpgGame.netData.guild.message.ResGuildItemAddMessage;
	import org.game.netCore.net.Handler;

	public class ResGuildItemAddHandler extends Handler {
	
		public override function action(): void{
			var msg: ResGuildItemAddMessage = ResGuildItemAddMessage(this.message);
			//TODO 添加消息处理
		}
	}
}