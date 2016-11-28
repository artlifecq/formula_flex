package com.rpgGame.netData.treasurehunt.handler{

	import com.rpgGame.netData.treasurehunt.message.ResHuntItemRemoveMessage;
	import org.game.netCore.net.Handler;

	public class ResHuntItemRemoveHandler extends Handler {
	
		public override function action(): void{
			var msg: ResHuntItemRemoveMessage = ResHuntItemRemoveMessage(this.message);
			//TODO 添加消息处理
		}
	}
}