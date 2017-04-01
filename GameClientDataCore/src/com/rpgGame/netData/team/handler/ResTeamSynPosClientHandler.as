package com.rpgGame.netData.team.handler{

	import com.rpgGame.netData.team.message.ResTeamSynPosClientMessage;
	import org.game.netCore.net.Handler;

	public class ResTeamSynPosClientHandler extends Handler {
	
		public override function action(): void{
			var msg: ResTeamSynPosClientMessage = ResTeamSynPosClientMessage(this.message);
			//TODO 添加消息处理
		}
	}
}