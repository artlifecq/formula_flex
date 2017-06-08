package com.rpgGame.netData.warFlag.handler{

	import com.rpgGame.netData.warFlag.message.SCWarFlagAllInfoToClientMessage;
	import org.game.netCore.net.Handler;

	public class SCWarFlagAllInfoToClientHandler extends Handler {
	
		public override function action(): void{
			var msg: SCWarFlagAllInfoToClientMessage = SCWarFlagAllInfoToClientMessage(this.message);
			//TODO 添加消息处理
		}
	}
}