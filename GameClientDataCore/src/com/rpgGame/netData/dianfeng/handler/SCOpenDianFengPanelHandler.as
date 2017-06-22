package com.rpgGame.netData.dianfeng.handler{

	import com.rpgGame.netData.dianfeng.message.SCOpenDianFengPanelMessage;
	import org.game.netCore.net.Handler;

	public class SCOpenDianFengPanelHandler extends Handler {
	
		public override function action(): void{
			var msg: SCOpenDianFengPanelMessage = SCOpenDianFengPanelMessage(this.message);
			//TODO 添加消息处理
		}
	}
}