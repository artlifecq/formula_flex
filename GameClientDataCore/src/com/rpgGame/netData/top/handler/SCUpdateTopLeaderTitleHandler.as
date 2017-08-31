package com.rpgGame.netData.top.handler{

	import com.rpgGame.netData.top.message.SCUpdateTopLeaderTitleMessage;
	import org.game.netCore.net.Handler;

	public class SCUpdateTopLeaderTitleHandler extends Handler {
	
		public override function action(): void{
			var msg: SCUpdateTopLeaderTitleMessage = SCUpdateTopLeaderTitleMessage(this.message);
			//TODO 添加消息处理
		}
	}
}