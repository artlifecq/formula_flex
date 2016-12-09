package com.rpgGame.netData.guild.handler{

	import com.rpgGame.netData.guild.message.ResUpdateGuildBossMessage;
	import org.game.netCore.net.Handler;

	public class ResUpdateGuildBossHandler extends Handler {
	
		public override function action(): void{
			var msg: ResUpdateGuildBossMessage = ResUpdateGuildBossMessage(this.message);
			//TODO 添加消息处理
		}
	}
}