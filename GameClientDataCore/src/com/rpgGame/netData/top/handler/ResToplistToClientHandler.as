package com.rpgGame.netData.top.handler{

	import com.rpgGame.netData.top.message.ResToplistToClientMessage;
	import org.game.netCore.net.Handler;

	public class ResToplistToClientHandler extends Handler {
	
		public override function action(): void{
			var msg: ResToplistToClientMessage = ResToplistToClientMessage(this.message);
			//TODO 添加消息处理
		}
	}
}