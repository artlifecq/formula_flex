package com.rpgGame.netData.guild.handler{

	import com.rpgGame.netData.guild.message.ResNoticeGuildBossApplyMessage;
	import org.game.netCore.net.Handler;

	public class ResNoticeGuildBossApplyHandler extends Handler {
	
		public override function action(): void{
			var msg: ResNoticeGuildBossApplyMessage = ResNoticeGuildBossApplyMessage(this.message);
			//TODO 添加消息处理
		}
	}
}