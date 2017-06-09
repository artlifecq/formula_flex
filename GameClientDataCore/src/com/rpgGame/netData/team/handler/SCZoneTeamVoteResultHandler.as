package com.rpgGame.netData.team.handler{

	import com.rpgGame.netData.team.message.SCZoneTeamVoteResultMessage;
	import org.game.netCore.net.Handler;

	public class SCZoneTeamVoteResultHandler extends Handler {
	
		public override function action(): void{
			var msg: SCZoneTeamVoteResultMessage = SCZoneTeamVoteResultMessage(this.message);
			//TODO 添加消息处理
		}
	}
}