package com.rpgGame.netData.player.handler{

	import com.rpgGame.netData.player.message.ResRechargeInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResRechargeInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResRechargeInfoMessage = ResRechargeInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}