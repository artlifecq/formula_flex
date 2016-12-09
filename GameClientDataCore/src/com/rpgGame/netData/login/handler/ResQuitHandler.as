package com.rpgGame.netData.login.handler{

	import com.rpgGame.netData.login.message.ResQuitMessage;
	import org.game.netCore.net.Handler;

	public class ResQuitHandler extends Handler {
	
		public override function action(): void{
			var msg: ResQuitMessage = ResQuitMessage(this.message);
			//TODO 添加消息处理
		}
	}
}