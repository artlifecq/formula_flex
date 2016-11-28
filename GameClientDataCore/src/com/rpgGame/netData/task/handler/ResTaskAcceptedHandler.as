package com.rpgGame.netData.task.handler{

	import com.rpgGame.netData.task.message.ResTaskAcceptedMessage;
	import org.game.netCore.net.Handler;

	public class ResTaskAcceptedHandler extends Handler {
	
		public override function action(): void{
			var msg: ResTaskAcceptedMessage = ResTaskAcceptedMessage(this.message);
			//TODO 添加消息处理
		}
	}
}