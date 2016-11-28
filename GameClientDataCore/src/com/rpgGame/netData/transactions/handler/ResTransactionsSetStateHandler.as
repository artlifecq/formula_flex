package com.rpgGame.netData.transactions.handler{

	import com.rpgGame.netData.transactions.message.ResTransactionsSetStateMessage;
	import org.game.netCore.net.Handler;

	public class ResTransactionsSetStateHandler extends Handler {
	
		public override function action(): void{
			var msg: ResTransactionsSetStateMessage = ResTransactionsSetStateMessage(this.message);
			//TODO 添加消息处理
		}
	}
}