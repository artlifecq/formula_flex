package com.rpgGame.netData.task.handler{

	import com.rpgGame.netData.task.message.SCNoMainTaskMessage;
	import org.game.netCore.net.Handler;

	public class SCNoMainTaskHandler extends Handler {
	
		public override function action(): void{
			var msg: SCNoMainTaskMessage = SCNoMainTaskMessage(this.message);
			//TODO 添加消息处理
		}
	}
}