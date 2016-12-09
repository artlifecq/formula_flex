package com.rpgGame.netData.moonbox.handler{

	import com.rpgGame.netData.moonbox.message.ResSendMoonBoxItemInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResSendMoonBoxItemInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResSendMoonBoxItemInfoMessage = ResSendMoonBoxItemInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}