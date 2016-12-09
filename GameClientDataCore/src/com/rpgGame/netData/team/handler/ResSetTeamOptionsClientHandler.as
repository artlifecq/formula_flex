package com.rpgGame.netData.team.handler{

	import com.rpgGame.netData.team.message.ResSetTeamOptionsClientMessage;
	import org.game.netCore.net.Handler;

	public class ResSetTeamOptionsClientHandler extends Handler {
	
		public override function action(): void{
			var msg: ResSetTeamOptionsClientMessage = ResSetTeamOptionsClientMessage(this.message);
			//TODO 添加消息处理
		}
	}
}