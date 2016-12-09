package com.rpgGame.netData.moonbox.handler{

	import com.rpgGame.netData.moonbox.message.ResSendMoonBoxStoreInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResSendMoonBoxStoreInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResSendMoonBoxStoreInfoMessage = ResSendMoonBoxStoreInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}