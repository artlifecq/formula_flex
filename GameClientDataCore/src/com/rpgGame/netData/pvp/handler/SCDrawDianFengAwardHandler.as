package com.rpgGame.netData.pvp.handler{

	import com.rpgGame.netData.pvp.message.SCDrawDianFengAwardMessage;
	import org.game.netCore.net.Handler;

	public class SCDrawDianFengAwardHandler extends Handler {
	
		public override function action(): void{
			var msg: SCDrawDianFengAwardMessage = SCDrawDianFengAwardMessage(this.message);
			//TODO 添加消息处理
		}
	}
}