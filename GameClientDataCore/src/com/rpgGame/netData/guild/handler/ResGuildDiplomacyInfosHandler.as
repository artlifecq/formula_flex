package com.rpgGame.netData.guild.handler{

	import com.rpgGame.netData.guild.message.ResGuildDiplomacyInfosMessage;
	import org.game.netCore.net.Handler;

	public class ResGuildDiplomacyInfosHandler extends Handler {
	
		public override function action(): void{
			var msg: ResGuildDiplomacyInfosMessage = ResGuildDiplomacyInfosMessage(this.message);
			//TODO 添加消息处理
		}
	}
}