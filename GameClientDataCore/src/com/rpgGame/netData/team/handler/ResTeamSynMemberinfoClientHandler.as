package com.rpgGame.netData.team.handler{

	import com.rpgGame.netData.team.message.ResTeamSynMemberinfoClientMessage;
	import org.game.netCore.net.Handler;

	public class ResTeamSynMemberinfoClientHandler extends Handler {
	
		public override function action(): void{
			var msg: ResTeamSynMemberinfoClientMessage = ResTeamSynMemberinfoClientMessage(this.message);
			//TODO 添加消息处理
		}
	}
}