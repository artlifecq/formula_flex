package com.rpgGame.netData.guild.handler{

	import com.rpgGame.netData.guild.message.ResGuildBriefnessInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResGuildBriefnessInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResGuildBriefnessInfoMessage = ResGuildBriefnessInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}