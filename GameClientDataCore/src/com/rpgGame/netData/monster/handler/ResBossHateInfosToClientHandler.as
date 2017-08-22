package com.rpgGame.netData.monster.handler{

	import com.rpgGame.netData.monster.message.ResBossHateInfosToClientMessage;
	import org.game.netCore.net.Handler;

	public class ResBossHateInfosToClientHandler extends Handler {
	
		public override function action(): void{
			var msg: ResBossHateInfosToClientMessage = ResBossHateInfosToClientMessage(this.message);
			//TODO 添加消息处理
		}
	}
}