package com.rpgGame.netData.pvp.handler{

	import com.rpgGame.netData.pvp.message.SCOpenDianFengPanelMessage;
	import org.game.netCore.net.Handler;

	public class SCOpenDianFengPanelHandler extends Handler {
	
		public override function action(): void{
			var msg: SCOpenDianFengPanelMessage = SCOpenDianFengPanelMessage(this.message);
			//TODO 添加消息处理
		}
	}
}