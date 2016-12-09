package com.rpgGame.netData.guild.handler{

	import com.rpgGame.netData.guild.message.ResSendGuildStoreInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResSendGuildStoreInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResSendGuildStoreInfoMessage = ResSendGuildStoreInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}