package com.rpgGame.netData.treasurehunt.handler{

	import com.rpgGame.netData.treasurehunt.message.ResHuntItemAddMessageMessage;
	import org.game.netCore.net.Handler;

	public class ResHuntItemAddMessageHandler extends Handler {
	
		public override function action(): void{
			var msg: ResHuntItemAddMessageMessage = ResHuntItemAddMessageMessage(this.message);
			//TODO 添加消息处理
		}
	}
}