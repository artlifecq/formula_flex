package com.rpgGame.netData.convoy.handler{

	import com.rpgGame.netData.convoy.message.SCConvoyNumMessage;
	import org.game.netCore.net.Handler;

	public class SCConvoyNumHandler extends Handler {
	
		public override function action(): void{
			var msg: SCConvoyNumMessage = SCConvoyNumMessage(this.message);
			//TODO 添加消息处理
		}
	}
}