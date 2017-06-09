package com.rpgGame.netData.guild.handler{

	import com.rpgGame.netData.guild.message.ResGuildOperateResultMessage;
	import org.game.netCore.net.Handler;

	public class ResGuildOperateResultHandler extends Handler {
	
		public override function action(): void{
			var msg: ResGuildOperateResultMessage = ResGuildOperateResultMessage(this.message);
			//TODO 添加消息处理
		}
	}
}