package com.rpgGame.netData.monster.handler{

	import com.rpgGame.netData.monster.message.SCLimitChallengeBossResultMessage;
	import org.game.netCore.net.Handler;

	public class SCLimitChallengeBossResultHandler extends Handler {
	
		public override function action(): void{
			var msg: SCLimitChallengeBossResultMessage = SCLimitChallengeBossResultMessage(this.message);
			//TODO 添加消息处理
		}
	}
}