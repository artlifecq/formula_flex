package com.rpgGame.netData.team.handler{

	import com.rpgGame.netData.team.message.ResAppointClientMessage;
	import org.game.netCore.net.Handler;

	public class ResAppointClientHandler extends Handler {
	
		public override function action(): void{
			var msg: ResAppointClientMessage = ResAppointClientMessage(this.message);
			//TODO 添加消息处理
		}
	}
}