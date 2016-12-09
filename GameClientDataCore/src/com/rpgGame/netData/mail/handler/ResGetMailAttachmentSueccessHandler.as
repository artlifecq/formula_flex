package com.rpgGame.netData.mail.handler{

	import com.rpgGame.netData.mail.message.ResGetMailAttachmentSueccessMessage;
	import org.game.netCore.net.Handler;

	public class ResGetMailAttachmentSueccessHandler extends Handler {
	
		public override function action(): void{
			var msg: ResGetMailAttachmentSueccessMessage = ResGetMailAttachmentSueccessMessage(this.message);
			//TODO 添加消息处理
		}
	}
}