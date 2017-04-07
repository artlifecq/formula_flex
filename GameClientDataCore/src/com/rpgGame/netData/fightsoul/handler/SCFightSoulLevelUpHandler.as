package com.rpgGame.netData.fightsoul.handler{

	import com.rpgGame.netData.fightsoul.message.SCFightSoulLevelUpMessage;
	import org.game.netCore.net.Handler;

	public class SCFightSoulLevelUpHandler extends Handler {
	
		public override function action(): void{
			var msg: SCFightSoulLevelUpMessage = SCFightSoulLevelUpMessage(this.message);
			//TODO 添加消息处理
		}
	}
}