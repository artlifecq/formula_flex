package com.rpgGame.netData.task.handler{

	import com.rpgGame.netData.task.message.ResTaskChangeMessage;
	import org.game.netCore.net.Handler;

	public class ResTaskChangeHandler extends Handler {
	
		public override function action(): void{
			var msg: ResTaskChangeMessage = ResTaskChangeMessage(this.message);
			//TODO 添加消息处理
		}
	}
}