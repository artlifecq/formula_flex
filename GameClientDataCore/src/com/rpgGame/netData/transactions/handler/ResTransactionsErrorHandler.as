package com.rpgGame.netData.transactions.handler{

	import com.rpgGame.netData.transactions.message.ResTransactionsErrorMessage;
	import org.game.netCore.net.Handler;

	public class ResTransactionsErrorHandler extends Handler {
	
		public override function action(): void{
			var msg: ResTransactionsErrorMessage = ResTransactionsErrorMessage(this.message);
			//TODO 添加消息处理
		}
	}
}