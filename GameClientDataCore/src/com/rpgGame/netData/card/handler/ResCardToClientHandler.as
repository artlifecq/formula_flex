package com.rpgGame.netData.card.handler{

	import com.rpgGame.netData.card.message.ResCardToClientMessage;
	import org.game.netCore.net.Handler;

	public class ResCardToClientHandler extends Handler {
	
		public override function action(): void{
			var msg: ResCardToClientMessage = ResCardToClientMessage(this.message);
			//TODO 添加消息处理
		}
	}
}