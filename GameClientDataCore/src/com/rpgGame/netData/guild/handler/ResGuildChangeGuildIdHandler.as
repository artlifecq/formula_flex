package com.rpgGame.netData.guild.handler{

	import com.rpgGame.netData.guild.message.ResGuildChangeGuildIdMessage;
	import org.game.netCore.net.Handler;

	public class ResGuildChangeGuildIdHandler extends Handler {
	
		public override function action(): void{
			var msg: ResGuildChangeGuildIdMessage = ResGuildChangeGuildIdMessage(this.message);
			//TODO 添加消息处理
		}
	}
}