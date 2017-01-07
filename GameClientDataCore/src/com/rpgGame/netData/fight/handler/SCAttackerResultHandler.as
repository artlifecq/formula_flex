package com.rpgGame.netData.fight.handler{

	import com.rpgGame.netData.fight.message.SCAttackerResultMessage;
	import org.game.netCore.net.Handler;

	public class SCAttackerResultHandler extends Handler {
	
		public override function action(): void{
			var msg: SCAttackerResultMessage = SCAttackerResultMessage(this.message);
			//TODO 添加消息处理
		}
	}
}