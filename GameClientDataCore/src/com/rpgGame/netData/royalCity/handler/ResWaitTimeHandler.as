package com.rpgGame.netData.royalCity.handler{

	import com.rpgGame.netData.royalCity.message.ResWaitTimeMessage;
	import org.game.netCore.net.Handler;

	public class ResWaitTimeHandler extends Handler {
	
		public override function action(): void{
			var msg: ResWaitTimeMessage = ResWaitTimeMessage(this.message);
			//TODO 添加消息处理
		}
	}
}