package com.rpgGame.netData.mail.handler{

	import com.rpgGame.netData.mail.message.ResAllMailsMessage;
	import org.game.netCore.net.Handler;

	public class ResAllMailsHandler extends Handler {
	
		public override function action(): void{
			var msg: ResAllMailsMessage = ResAllMailsMessage(this.message);
			//TODO 添加消息处理
		}
	}
}