package com.rpgGame.netData.yaota.handler{

	import com.rpgGame.netData.yaota.message.SCDrawYaoTaAwardMessage;
	import org.game.netCore.net.Handler;

	public class SCDrawYaoTaAwardHandler extends Handler {
	
		public override function action(): void{
			var msg: SCDrawYaoTaAwardMessage = SCDrawYaoTaAwardMessage(this.message);
			//TODO 添加消息处理
		}
	}
}