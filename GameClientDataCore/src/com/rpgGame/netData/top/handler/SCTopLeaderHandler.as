package com.rpgGame.netData.top.handler{

	import com.rpgGame.netData.top.message.SCTopLeaderMessage;
	import org.game.netCore.net.Handler;

	public class SCTopLeaderHandler extends Handler {
	
		public override function action(): void{
			var msg: SCTopLeaderMessage = SCTopLeaderMessage(this.message);
			//TODO 添加消息处理
		}
	}
}