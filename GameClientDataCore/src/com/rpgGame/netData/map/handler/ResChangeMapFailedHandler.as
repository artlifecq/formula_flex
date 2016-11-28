package com.rpgGame.netData.map.handler{

	import com.rpgGame.netData.map.message.ResChangeMapFailedMessage;
	import org.game.netCore.net.Handler;

	public class ResChangeMapFailedHandler extends Handler {
	
		public override function action(): void{
			var msg: ResChangeMapFailedMessage = ResChangeMapFailedMessage(this.message);
			//TODO 添加消息处理
		}
	}
}