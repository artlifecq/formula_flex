package com.rpgGame.netData.junjie.handler{

	import com.rpgGame.netData.junjie.message.SCUpdateRoundMessage;
	import org.game.netCore.net.Handler;

	public class SCUpdateRoundHandler extends Handler {
	
		public override function action(): void{
			var msg: SCUpdateRoundMessage = SCUpdateRoundMessage(this.message);
			//TODO 添加消息处理
		}
	}
}