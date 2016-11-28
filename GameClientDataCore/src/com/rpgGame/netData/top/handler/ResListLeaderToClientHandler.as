package com.rpgGame.netData.top.handler{

	import com.rpgGame.netData.top.message.ResListLeaderToClientMessage;
	import org.game.netCore.net.Handler;

	public class ResListLeaderToClientHandler extends Handler {
	
		public override function action(): void{
			var msg: ResListLeaderToClientMessage = ResListLeaderToClientMessage(this.message);
			//TODO 添加消息处理
		}
	}
}