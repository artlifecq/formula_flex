package com.rpgGame.netData.map.handler{

	import com.rpgGame.netData.map.message.SCUpdateTopLeaderMessage;
	import org.game.netCore.net.Handler;

	public class SCUpdateTopLeaderHandler extends Handler {
	
		public override function action(): void{
			var msg: SCUpdateTopLeaderMessage = SCUpdateTopLeaderMessage(this.message);
			//TODO 添加消息处理
		}
	}
}