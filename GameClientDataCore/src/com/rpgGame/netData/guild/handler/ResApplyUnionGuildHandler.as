package com.rpgGame.netData.guild.handler{

	import com.rpgGame.netData.guild.message.ResApplyUnionGuildMessage;
	import org.game.netCore.net.Handler;

	public class ResApplyUnionGuildHandler extends Handler {
	
		public override function action(): void{
			var msg: ResApplyUnionGuildMessage = ResApplyUnionGuildMessage(this.message);
			//TODO 添加消息处理
		}
	}
}