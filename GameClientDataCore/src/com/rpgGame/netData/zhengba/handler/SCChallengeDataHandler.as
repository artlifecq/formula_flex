package com.rpgGame.netData.zhengba.handler{

	import com.rpgGame.netData.zhengba.message.SCChallengeDataMessage;
	import org.game.netCore.net.Handler;

	public class SCChallengeDataHandler extends Handler {
	
		public override function action(): void{
			var msg: SCChallengeDataMessage = SCChallengeDataMessage(this.message);
			//TODO 添加消息处理
		}
	}
}