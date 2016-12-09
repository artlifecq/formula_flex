package com.rpgGame.netData.transactions.handler{

	import com.rpgGame.netData.transactions.message.ResTransactionsChangeYuanbaoMessage;
	import org.game.netCore.net.Handler;

	public class ResTransactionsChangeYuanbaoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResTransactionsChangeYuanbaoMessage = ResTransactionsChangeYuanbaoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}