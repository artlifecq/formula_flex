package com.rpgGame.netData.top.handler{

	import com.rpgGame.netData.top.message.SCUpdateTopLeaderMessage;
	import org.game.netCore.net.Handler;

	public class SCUpdateTopLeaderHandler extends Handler {
	
		public override function action(): void{
			var msg: SCUpdateTopLeaderMessage = SCUpdateTopLeaderMessage(this.message);
			//TODO 添加消息处理
		}
	}
}