package com.rpgGame.netData.player.handler{

	import com.rpgGame.netData.player.message.ReskillnumToClientMessage;
	import org.game.netCore.net.Handler;

	public class ReskillnumToClientHandler extends Handler {
	
		public override function action(): void{
			var msg: ReskillnumToClientMessage = ReskillnumToClientMessage(this.message);
			//TODO 添加消息处理
		}
	}
}