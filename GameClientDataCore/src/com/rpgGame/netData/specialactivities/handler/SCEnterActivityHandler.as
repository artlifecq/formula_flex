package com.rpgGame.netData.specialactivities.handler{

	import com.rpgGame.netData.specialactivities.message.SCEnterActivityMessage;
	import org.game.netCore.net.Handler;

	public class SCEnterActivityHandler extends Handler {
	
		public override function action(): void{
			var msg: SCEnterActivityMessage = SCEnterActivityMessage(this.message);
			//TODO 添加消息处理
		}
	}
}