package com.rpgGame.netData.cross.handler{

	import com.rpgGame.netData.cross.message.SCStartTeamMatchMessage;
	import org.game.netCore.net.Handler;

	public class SCStartTeamMatchHandler extends Handler {
	
		public override function action(): void{
			var msg: SCStartTeamMatchMessage = SCStartTeamMatchMessage(this.message);
			//TODO 添加消息处理
		}
	}
}