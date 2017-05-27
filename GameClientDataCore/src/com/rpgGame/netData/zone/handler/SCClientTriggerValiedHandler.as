package com.rpgGame.netData.zone.handler{

	import com.rpgGame.netData.zone.message.SCClientTriggerValiedMessage;
	import org.game.netCore.net.Handler;

	public class SCClientTriggerValiedHandler extends Handler {
	
		public override function action(): void{
			var msg: SCClientTriggerValiedMessage = SCClientTriggerValiedMessage(this.message);
			//TODO 添加消息处理
		}
	}
}