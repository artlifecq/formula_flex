package com.rpgGame.netData.mail.handler{

	import com.rpgGame.netData.mail.message.ResMailDetailInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResMailDetailInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResMailDetailInfoMessage = ResMailDetailInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}