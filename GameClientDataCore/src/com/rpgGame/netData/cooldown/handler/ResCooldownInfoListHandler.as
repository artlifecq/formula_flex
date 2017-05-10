package com.rpgGame.netData.cooldown.handler{

	import com.rpgGame.netData.cooldown.message.ResCooldownInfoListMessage;
	import org.game.netCore.net.Handler;

	public class ResCooldownInfoListHandler extends Handler {
	
		public override function action(): void{
			var msg: ResCooldownInfoListMessage = ResCooldownInfoListMessage(this.message);
			//TODO 添加消息处理
		}
	}
}