package com.rpgGame.netData.team.handler{

	import com.rpgGame.netData.team.message.ResTeamExteriorClientMessage;
	import org.game.netCore.net.Handler;

	public class ResTeamExteriorClientHandler extends Handler {
	
		public override function action(): void{
			var msg: ResTeamExteriorClientMessage = ResTeamExteriorClientMessage(this.message);
			//TODO 添加消息处理
		}
	}
}