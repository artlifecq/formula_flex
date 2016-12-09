package com.rpgGame.netData.guild.handler{

	import com.rpgGame.netData.guild.message.ResGuildStoreApplylistMessage;
	import org.game.netCore.net.Handler;

	public class ResGuildStoreApplylistHandler extends Handler {
	
		public override function action(): void{
			var msg: ResGuildStoreApplylistMessage = ResGuildStoreApplylistMessage(this.message);
			//TODO 添加消息处理
		}
	}
}