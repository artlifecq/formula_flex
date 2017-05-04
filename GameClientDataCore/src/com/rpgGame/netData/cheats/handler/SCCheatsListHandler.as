package com.rpgGame.netData.cheats.handler{

	import com.rpgGame.netData.cheats.message.SCCheatsListMessage;
	import org.game.netCore.net.Handler;

	public class SCCheatsListHandler extends Handler {
	
		public override function action(): void{
			var msg: SCCheatsListMessage = SCCheatsListMessage(this.message);
			//TODO 添加消息处理
		}
	}
}