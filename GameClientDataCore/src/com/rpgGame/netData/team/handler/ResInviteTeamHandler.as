package com.rpgGame.netData.team.handler{

	import com.rpgGame.netData.team.message.ResInviteTeamMessage;
	import org.game.netCore.net.Handler;

	public class ResInviteTeamHandler extends Handler {
	
		public override function action(): void{
			var msg: ResInviteTeamMessage = ResInviteTeamMessage(this.message);
			//TODO 添加消息处理
		}
	}
}