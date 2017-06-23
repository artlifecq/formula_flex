package com.rpgGame.netData.team.handler{

	import com.rpgGame.netData.team.message.SCHaveTeamMessage;
	import org.game.netCore.net.Handler;

	public class SCHaveTeamHandler extends Handler {
	
		public override function action(): void{
			var msg: SCHaveTeamMessage = SCHaveTeamMessage(this.message);
			//TODO 添加消息处理
		}
	}
}