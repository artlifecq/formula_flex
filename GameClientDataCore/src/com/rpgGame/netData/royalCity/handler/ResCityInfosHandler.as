package com.rpgGame.netData.royalCity.handler{

	import com.rpgGame.netData.royalCity.message.ResCityInfosMessage;
	import org.game.netCore.net.Handler;

	public class ResCityInfosHandler extends Handler {
	
		public override function action(): void{
			var msg: ResCityInfosMessage = ResCityInfosMessage(this.message);
			//TODO 添加消息处理
		}
	}
}