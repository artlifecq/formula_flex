package com.rpgGame.netData.treasurehunt.handler{

	import com.rpgGame.netData.treasurehunt.message.ResSendHuntStoreInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResSendHuntStoreInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResSendHuntStoreInfoMessage = ResSendHuntStoreInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}