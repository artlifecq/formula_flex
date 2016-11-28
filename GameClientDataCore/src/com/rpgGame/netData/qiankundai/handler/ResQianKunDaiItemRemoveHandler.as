package com.rpgGame.netData.qiankundai.handler{

	import com.rpgGame.netData.qiankundai.message.ResQianKunDaiItemRemoveMessage;
	import org.game.netCore.net.Handler;

	public class ResQianKunDaiItemRemoveHandler extends Handler {
	
		public override function action(): void{
			var msg: ResQianKunDaiItemRemoveMessage = ResQianKunDaiItemRemoveMessage(this.message);
			//TODO 添加消息处理
		}
	}
}