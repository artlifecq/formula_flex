package com.rpgGame.netData.login.handler{

	import com.rpgGame.netData.login.message.ResErrorMessage;
	import org.game.netCore.net.Handler;

	public class ResErrorHandler extends Handler {
	
		public override function action(): void{
			var msg: ResErrorMessage = ResErrorMessage(this.message);
			//TODO 添加消息处理
		}
	}
}