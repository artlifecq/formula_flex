package com.rpgGame.netData.transactions.handler{

	import com.rpgGame.netData.transactions.message.ResTransactionsStartMessage;
	import org.game.netCore.net.Handler;

	public class ResTransactionsStartHandler extends Handler {
	
		public override function action(): void{
			var msg: ResTransactionsStartMessage = ResTransactionsStartMessage(this.message);
			//TODO 添加消息处理
		}
	}
}