package com.rpgGame.netData.guild.handler{

	import com.rpgGame.netData.guild.message.ResGuildZoneResultMessage;
	import org.game.netCore.net.Handler;

	public class ResGuildZoneResultHandler extends Handler {
	
		public override function action(): void{
			var msg: ResGuildZoneResultMessage = ResGuildZoneResultMessage(this.message);
			//TODO 添加消息处理
		}
	}
}