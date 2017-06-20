package com.rpgGame.netData.yaota.handler{

	import com.rpgGame.netData.yaota.message.SCYaoTaIntegralMessage;
	import org.game.netCore.net.Handler;

	public class SCYaoTaIntegralHandler extends Handler {
	
		public override function action(): void{
			var msg: SCYaoTaIntegralMessage = SCYaoTaIntegralMessage(this.message);
			//TODO 添加消息处理
		}
	}
}