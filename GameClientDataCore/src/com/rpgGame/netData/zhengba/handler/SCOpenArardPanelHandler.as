package com.rpgGame.netData.zhengba.handler{

	import com.rpgGame.netData.zhengba.message.SCOpenArardPanelMessage;
	import org.game.netCore.net.Handler;

	public class SCOpenArardPanelHandler extends Handler {
	
		public override function action(): void{
			var msg: SCOpenArardPanelMessage = SCOpenArardPanelMessage(this.message);
			//TODO 添加消息处理
		}
	}
}