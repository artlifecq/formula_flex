package com.rpgGame.netData.chat.handler{

	import com.rpgGame.netData.chat.message.ResChatRecordMessage;
	import org.game.netCore.net.Handler;

	public class ResChatRecordHandler extends Handler {
	
		public override function action(): void{
			var msg: ResChatRecordMessage = ResChatRecordMessage(this.message);
			//TODO 添加消息处理
		}
	}
}