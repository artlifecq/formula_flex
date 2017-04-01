package com.rpgGame.netData.qiankundai.handler{

	import com.rpgGame.netData.qiankundai.message.ResQianKunDaiItemInfosMessage;
	import org.game.netCore.net.Handler;

	public class ResQianKunDaiItemInfosHandler extends Handler {
	
		public override function action(): void{
			var msg: ResQianKunDaiItemInfosMessage = ResQianKunDaiItemInfosMessage(this.message);
			//TODO 添加消息处理
		}
	}
}