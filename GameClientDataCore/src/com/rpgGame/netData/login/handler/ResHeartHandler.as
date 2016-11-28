package com.rpgGame.netData.login.handler{

	import com.rpgGame.netData.login.message.ResHeartMessage;
	import org.game.netCore.net.Handler;

	public class ResHeartHandler extends Handler {
	
		public override function action(): void{
			var msg: ResHeartMessage = ResHeartMessage(this.message);
			//TODO 添加消息处理
		}
	}
}