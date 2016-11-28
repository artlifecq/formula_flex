package com.rpgGame.netData.transactions.handler{

	import com.rpgGame.netData.transactions.message.ResTransactionsSuccessMessage;
	import org.game.netCore.net.Handler;

	public class ResTransactionsSuccessHandler extends Handler {
	
		public override function action(): void{
			var msg: ResTransactionsSuccessMessage = ResTransactionsSuccessMessage(this.message);
			//TODO 添加消息处理
		}
	}
}