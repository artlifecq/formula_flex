package com.rpgGame.netData.qiankundai.handler{

	import com.rpgGame.netData.qiankundai.message.ResQianKunDaiItemAddMessage;
	import org.game.netCore.net.Handler;

	public class ResQianKunDaiItemAddHandler extends Handler {
	
		public override function action(): void{
			var msg: ResQianKunDaiItemAddMessage = ResQianKunDaiItemAddMessage(this.message);
			//TODO 添加消息处理
		}
	}
}