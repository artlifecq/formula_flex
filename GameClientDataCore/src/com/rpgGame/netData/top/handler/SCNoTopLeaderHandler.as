package com.rpgGame.netData.top.handler{

	import com.rpgGame.netData.top.message.SCNoTopLeaderMessage;
	import org.game.netCore.net.Handler;

	public class SCNoTopLeaderHandler extends Handler {
	
		public override function action(): void{
			var msg: SCNoTopLeaderMessage = SCNoTopLeaderMessage(this.message);
			//TODO 添加消息处理
		}
	}
}