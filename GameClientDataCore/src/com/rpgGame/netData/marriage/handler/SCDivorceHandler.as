package com.rpgGame.netData.marriage.handler{

	import com.rpgGame.netData.marriage.message.SCDivorceMessage;
	import org.game.netCore.net.Handler;

	public class SCDivorceHandler extends Handler {
	
		public override function action(): void{
			var msg: SCDivorceMessage = SCDivorceMessage(this.message);
			//TODO 添加消息处理
		}
	}
}