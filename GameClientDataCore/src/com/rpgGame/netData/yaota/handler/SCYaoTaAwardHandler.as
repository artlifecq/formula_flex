package com.rpgGame.netData.yaota.handler{

	import com.rpgGame.netData.yaota.message.SCYaoTaAwardMessage;
	import org.game.netCore.net.Handler;

	public class SCYaoTaAwardHandler extends Handler {
	
		public override function action(): void{
			var msg: SCYaoTaAwardMessage = SCYaoTaAwardMessage(this.message);
			//TODO 添加消息处理
		}
	}
}