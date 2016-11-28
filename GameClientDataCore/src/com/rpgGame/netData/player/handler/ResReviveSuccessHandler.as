package com.rpgGame.netData.player.handler{

	import com.rpgGame.netData.player.message.ResReviveSuccessMessage;
	import org.game.netCore.net.Handler;

	public class ResReviveSuccessHandler extends Handler {
	
		public override function action(): void{
			var msg: ResReviveSuccessMessage = ResReviveSuccessMessage(this.message);
			//TODO 添加消息处理
		}
	}
}