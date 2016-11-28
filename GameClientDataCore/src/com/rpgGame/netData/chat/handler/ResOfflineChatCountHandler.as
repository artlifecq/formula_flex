package com.rpgGame.netData.chat.handler{

	import com.rpgGame.netData.chat.message.ResOfflineChatCountMessage;
	import org.game.netCore.net.Handler;

	public class ResOfflineChatCountHandler extends Handler {
	
		public override function action(): void{
			var msg: ResOfflineChatCountMessage = ResOfflineChatCountMessage(this.message);
			//TODO 添加消息处理
		}
	}
}