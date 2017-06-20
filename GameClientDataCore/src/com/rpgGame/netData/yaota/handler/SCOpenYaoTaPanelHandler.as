package com.rpgGame.netData.yaota.handler{

	import com.rpgGame.netData.yaota.message.SCOpenYaoTaPanelMessage;
	import org.game.netCore.net.Handler;

	public class SCOpenYaoTaPanelHandler extends Handler {
	
		public override function action(): void{
			var msg: SCOpenYaoTaPanelMessage = SCOpenYaoTaPanelMessage(this.message);
			//TODO 添加消息处理
		}
	}
}