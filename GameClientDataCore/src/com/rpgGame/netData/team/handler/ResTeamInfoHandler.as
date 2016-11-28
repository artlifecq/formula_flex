package com.rpgGame.netData.team.handler{

	import com.rpgGame.netData.team.message.ResTeamInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResTeamInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResTeamInfoMessage = ResTeamInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}