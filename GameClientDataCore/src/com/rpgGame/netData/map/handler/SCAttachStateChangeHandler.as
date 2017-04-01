package com.rpgGame.netData.map.handler{

	import com.rpgGame.netData.map.message.SCAttachStateChangeMessage;
	import org.game.netCore.net.Handler;

	public class SCAttachStateChangeHandler extends Handler {
	
		public override function action(): void{
			var msg: SCAttachStateChangeMessage = SCAttachStateChangeMessage(this.message);
			//TODO 添加消息处理
		}
	}
}