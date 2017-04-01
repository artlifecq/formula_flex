package com.rpgGame.netData.guild.handler{

	import com.rpgGame.netData.guild.message.ResGuildGetEventListMessage;
	import org.game.netCore.net.Handler;

	public class ResGuildGetEventListHandler extends Handler {
	
		public override function action(): void{
			var msg: ResGuildGetEventListMessage = ResGuildGetEventListMessage(this.message);
			//TODO 添加消息处理
		}
	}
}