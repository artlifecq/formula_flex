package com.rpgGame.netData.team.handler{

	import com.rpgGame.netData.team.message.ResLeaveTeamMessage;
	import org.game.netCore.net.Handler;

	public class ResLeaveTeamHandler extends Handler {
	
		public override function action(): void{
			var msg: ResLeaveTeamMessage = ResLeaveTeamMessage(this.message);
			//TODO 添加消息处理
		}
	}
}