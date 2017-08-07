package com.rpgGame.netData.guild.handler{

	import com.rpgGame.netData.guild.message.ReplyGuildApplyOperationMessage;
	import org.game.netCore.net.Handler;

	public class ReplyGuildApplyOperationHandler extends Handler {
	
		public override function action(): void{
			var msg: ReplyGuildApplyOperationMessage = ReplyGuildApplyOperationMessage(this.message);
			//TODO 添加消息处理
		}
	}
}