package com.rpgGame.netData.zhengba.handler{

	import com.rpgGame.netData.zhengba.message.SCChallengeResultMessage;
	import org.game.netCore.net.Handler;

	public class SCChallengeResultHandler extends Handler {
	
		public override function action(): void{
			var msg: SCChallengeResultMessage = SCChallengeResultMessage(this.message);
			//TODO 添加消息处理
		}
	}
}