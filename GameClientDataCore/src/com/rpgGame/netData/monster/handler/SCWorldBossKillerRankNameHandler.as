package com.rpgGame.netData.monster.handler{

	import com.rpgGame.netData.monster.message.SCWorldBossKillerRankNameMessage;
	import org.game.netCore.net.Handler;

	public class SCWorldBossKillerRankNameHandler extends Handler {
	
		public override function action(): void{
			var msg: SCWorldBossKillerRankNameMessage = SCWorldBossKillerRankNameMessage(this.message);
			//TODO 添加消息处理
		}
	}
}