package com.rpgGame.netData.transactions.handler{

	import com.rpgGame.netData.transactions.message.ResTransactionsCanceledMessage;
	import org.game.netCore.net.Handler;

	public class ResTransactionsCanceledHandler extends Handler {
	
		public override function action(): void{
			var msg: ResTransactionsCanceledMessage = ResTransactionsCanceledMessage(this.message);
			//TODO 添加消息处理
		}
	}
}