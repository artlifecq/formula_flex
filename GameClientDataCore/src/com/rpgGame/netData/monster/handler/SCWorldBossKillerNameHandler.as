package com.rpgGame.netData.monster.handler{

	import com.rpgGame.netData.monster.message.SCWorldBossKillerNameMessage;
	import org.game.netCore.net.Handler;

	public class SCWorldBossKillerNameHandler extends Handler {
	
		public override function action(): void{
			var msg: SCWorldBossKillerNameMessage = SCWorldBossKillerNameMessage(this.message);
			//TODO 添加消息处理
		}
	}
}