package com.rpgGame.netData.convoy.handler{

	import com.rpgGame.netData.convoy.message.SCConvoyInfoMessage;
	import org.game.netCore.net.Handler;

	public class SCConvoyInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: SCConvoyInfoMessage = SCConvoyInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}