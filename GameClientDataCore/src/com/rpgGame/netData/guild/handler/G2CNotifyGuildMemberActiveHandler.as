package com.rpgGame.netData.guild.handler{

	import com.rpgGame.netData.guild.message.G2CNotifyGuildMemberActiveMessage;
	import org.game.netCore.net.Handler;

	public class G2CNotifyGuildMemberActiveHandler extends Handler {
	
		public override function action(): void{
			var msg: G2CNotifyGuildMemberActiveMessage = G2CNotifyGuildMemberActiveMessage(this.message);
			//TODO 添加消息处理
		}
	}
}