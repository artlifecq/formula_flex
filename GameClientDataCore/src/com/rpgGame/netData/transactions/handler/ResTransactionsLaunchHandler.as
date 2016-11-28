package com.rpgGame.netData.transactions.handler{

	import com.rpgGame.netData.transactions.message.ResTransactionsLaunchMessage;
	import org.game.netCore.net.Handler;

	public class ResTransactionsLaunchHandler extends Handler {
	
		public override function action(): void{
			var msg: ResTransactionsLaunchMessage = ResTransactionsLaunchMessage(this.message);
			//TODO 添加消息处理
		}
	}
}