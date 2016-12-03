package com.rpgGame.netData.player.handler{

	import com.rpgGame.netData.player.message.SCPlayerLevelUpMessage;
	import org.game.netCore.net.Handler;

	public class SCPlayerLevelUpHandler extends Handler {
	
		public override function action(): void{
			var msg: SCPlayerLevelUpMessage = SCPlayerLevelUpMessage(this.message);
			//TODO 添加消息处理
		}
	}
}