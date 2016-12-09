package com.rpgGame.netData.transactions.handler{

	import com.rpgGame.netData.transactions.message.ResTransactionsIntoItemMessage;
	import org.game.netCore.net.Handler;

	public class ResTransactionsIntoItemHandler extends Handler {
	
		public override function action(): void{
			var msg: ResTransactionsIntoItemMessage = ResTransactionsIntoItemMessage(this.message);
			//TODO 添加消息处理
		}
	}
}