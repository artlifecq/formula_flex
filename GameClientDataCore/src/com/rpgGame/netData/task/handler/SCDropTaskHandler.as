package com.rpgGame.netData.task.handler{

	import com.rpgGame.netData.task.message.SCDropTaskMessage;
	import org.game.netCore.net.Handler;

	public class SCDropTaskHandler extends Handler {
	
		public override function action(): void{
			var msg: SCDropTaskMessage = SCDropTaskMessage(this.message);
			//TODO 添加消息处理
		}
	}
}