package com.rpgGame.netData.mail.handler{

	import com.rpgGame.netData.mail.message.ResRecevieNewMailMessage;
	import org.game.netCore.net.Handler;

	public class ResRecevieNewMailHandler extends Handler {
	
		public override function action(): void{
			var msg: ResRecevieNewMailMessage = ResRecevieNewMailMessage(this.message);
			//TODO 添加消息处理
		}
	}
}