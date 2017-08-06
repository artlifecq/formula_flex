package com.rpgGame.netData.guild.handler{

	import com.rpgGame.netData.guild.message.G2CNotifyGuildActiveMessage;
	import org.game.netCore.net.Handler;

	public class G2CNotifyGuildActiveHandler extends Handler {
	
		public override function action(): void{
			var msg: G2CNotifyGuildActiveMessage = G2CNotifyGuildActiveMessage(this.message);
			//TODO 添加消息处理
		}
	}
}