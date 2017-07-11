package com.rpgGame.netData.daysdowngold.handler{

	import com.rpgGame.netData.daysdowngold.message.SCActivityTimeMessage;
	import org.game.netCore.net.Handler;

	public class SCActivityTimeHandler extends Handler {
	
		public override function action(): void{
			var msg: SCActivityTimeMessage = SCActivityTimeMessage(this.message);
			//TODO 添加消息处理
		}
	}
}