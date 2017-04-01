package com.rpgGame.netData.player.handler{

	import com.rpgGame.netData.player.message.SCMaxValueChangeMessage;
	import org.game.netCore.net.Handler;

	public class SCMaxValueChangeHandler extends Handler {
	
		public override function action(): void{
			var msg: SCMaxValueChangeMessage = SCMaxValueChangeMessage(this.message);
			//TODO 添加消息处理
		}
	}
}