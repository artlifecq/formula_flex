package com.rpgGame.netData.transactions.handler{

	import com.rpgGame.netData.transactions.message.ResTmpYuanbaoLogMessage;
	import org.game.netCore.net.Handler;

	public class ResTmpYuanbaoLogHandler extends Handler {
	
		public override function action(): void{
			var msg: ResTmpYuanbaoLogMessage = ResTmpYuanbaoLogMessage(this.message);
			//TODO 添加消息处理
		}
	}
}