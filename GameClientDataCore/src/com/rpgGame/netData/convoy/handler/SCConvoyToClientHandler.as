package com.rpgGame.netData.convoy.handler{

	import com.rpgGame.netData.convoy.message.SCConvoyToClientMessage;
	import org.game.netCore.net.Handler;

	public class SCConvoyToClientHandler extends Handler {
	
		public override function action(): void{
			var msg: SCConvoyToClientMessage = SCConvoyToClientMessage(this.message);
			//TODO 添加消息处理
		}
	}
}