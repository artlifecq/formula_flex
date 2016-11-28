package com.rpgGame.netData.team.handler{

	import com.rpgGame.netData.team.message.ResMapSearchTeamInfoClientMessage;
	import org.game.netCore.net.Handler;

	public class ResMapSearchTeamInfoClientHandler extends Handler {
	
		public override function action(): void{
			var msg: ResMapSearchTeamInfoClientMessage = ResMapSearchTeamInfoClientMessage(this.message);
			//TODO 添加消息处理
		}
	}
}