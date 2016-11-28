package com.rpgGame.netData.cross.handler{

	import com.rpgGame.netData.cross.message.ResChangeServerGameToClientMessage;
	import org.game.netCore.net.Handler;

	public class ResChangeServerGameToClientHandler extends Handler {
	
		public override function action(): void{
			var msg: ResChangeServerGameToClientMessage = ResChangeServerGameToClientMessage(this.message);
			//TODO 添加消息处理
		}
	}
}