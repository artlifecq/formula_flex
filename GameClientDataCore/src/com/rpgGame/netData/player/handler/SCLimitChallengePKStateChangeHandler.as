package com.rpgGame.netData.player.handler{

	import com.rpgGame.netData.player.message.SCLimitChallengePKStateChangeMessage;
	import org.game.netCore.net.Handler;

	public class SCLimitChallengePKStateChangeHandler extends Handler {
	
		public override function action(): void{
			var msg: SCLimitChallengePKStateChangeMessage = SCLimitChallengePKStateChangeMessage(this.message);
			//TODO 添加消息处理
		}
	}
}