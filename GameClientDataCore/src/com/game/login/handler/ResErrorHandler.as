package com.game.login.handler{

	import com.game.login.message.ResErrorMessage;
	
	import org.game.netCore.net.Handler;

	public class ResErrorHandler extends Handler {
	
		public override function action(): void{
			var msg: ResErrorMessage = ResErrorMessage(this.message);
			//TODO 添加消息处理
		}
	}
}