package com.rpgGame.netData.task.handler{

	import com.rpgGame.netData.task.message.ResTaskSubmitedMessage;
	import org.game.netCore.net.Handler;

	public class ResTaskSubmitedHandler extends Handler {
	
		public override function action(): void{
			var msg: ResTaskSubmitedMessage = ResTaskSubmitedMessage(this.message);
			//TODO 添加消息处理
		}
	}
}