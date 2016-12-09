package com.rpgGame.netData.royalCity.handler{

	import com.rpgGame.netData.royalCity.message.ResCityWarStartMessage;
	import org.game.netCore.net.Handler;

	public class ResCityWarStartHandler extends Handler {
	
		public override function action(): void{
			var msg: ResCityWarStartMessage = ResCityWarStartMessage(this.message);
			//TODO 添加消息处理
		}
	}
}