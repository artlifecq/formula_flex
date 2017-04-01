package com.rpgGame.netData.guild.handler{

	import com.rpgGame.netData.guild.message.ResGuildStoreOptAddMessage;
	import org.game.netCore.net.Handler;

	public class ResGuildStoreOptAddHandler extends Handler {
	
		public override function action(): void{
			var msg: ResGuildStoreOptAddMessage = ResGuildStoreOptAddMessage(this.message);
			//TODO 添加消息处理
		}
	}
}