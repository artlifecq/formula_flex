package com.rpgGame.netData.treasurehunt.handler{

	import com.rpgGame.netData.treasurehunt.message.ResSendHuntHistoryInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResSendHuntHistoryInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResSendHuntHistoryInfoMessage = ResSendHuntHistoryInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}