package com.rpgGame.netData.team.handler{

	import com.rpgGame.netData.team.message.ResGenericSearchToClientMessage;
	import org.game.netCore.net.Handler;

	public class ResGenericSearchToClientHandler extends Handler {
	
		public override function action(): void{
			var msg: ResGenericSearchToClientMessage = ResGenericSearchToClientMessage(this.message);
			//TODO 添加消息处理
		}
	}
}