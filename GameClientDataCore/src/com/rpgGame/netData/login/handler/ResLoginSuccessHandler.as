package com.rpgGame.netData.login.handler{

	import com.rpgGame.netData.login.message.ResLoginSuccessMessage;
	
	import org.game.netCore.net.Handler;

	public class ResLoginSuccessHandler extends Handler {
	
		public override function action(): void{
			var msg: ResLoginSuccessMessage = ResLoginSuccessMessage(this.message);
			//TODO 添加消息处理
		}
	}
}