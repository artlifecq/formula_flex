package com.rpgGame.netData.warFlag.handler{

	import com.rpgGame.netData.warFlag.message.SCWarFlagUpResultToClientMessage;
	import org.game.netCore.net.Handler;

	public class SCWarFlagUpResultToClientHandler extends Handler {
	
		public override function action(): void{
			var msg: SCWarFlagUpResultToClientMessage = SCWarFlagUpResultToClientMessage(this.message);
			//TODO 添加消息处理
		}
	}
}