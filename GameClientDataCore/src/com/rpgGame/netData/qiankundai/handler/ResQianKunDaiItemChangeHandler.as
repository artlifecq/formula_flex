package com.rpgGame.netData.qiankundai.handler{

	import com.rpgGame.netData.qiankundai.message.ResQianKunDaiItemChangeMessage;
	import org.game.netCore.net.Handler;

	public class ResQianKunDaiItemChangeHandler extends Handler {
	
		public override function action(): void{
			var msg: ResQianKunDaiItemChangeMessage = ResQianKunDaiItemChangeMessage(this.message);
			//TODO 添加消息处理
		}
	}
}