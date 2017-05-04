package com.rpgGame.netData.cheats.handler{

	import com.rpgGame.netData.cheats.message.SCNodeInfoMessage;
	import org.game.netCore.net.Handler;

	public class SCNodeInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: SCNodeInfoMessage = SCNodeInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}