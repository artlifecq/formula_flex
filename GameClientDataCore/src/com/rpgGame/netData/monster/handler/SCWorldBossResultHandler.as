package com.rpgGame.netData.monster.handler{

	import com.rpgGame.netData.monster.message.SCWorldBossResultMessage;
	import org.game.netCore.net.Handler;

	public class SCWorldBossResultHandler extends Handler {
	
		public override function action(): void{
			var msg: SCWorldBossResultMessage = SCWorldBossResultMessage(this.message);
			//TODO 添加消息处理
		}
	}
}