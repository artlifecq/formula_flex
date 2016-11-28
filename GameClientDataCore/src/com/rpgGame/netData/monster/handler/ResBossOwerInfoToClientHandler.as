package com.rpgGame.netData.monster.handler{

	import com.rpgGame.netData.monster.message.ResBossOwerInfoToClientMessage;
	import org.game.netCore.net.Handler;

	public class ResBossOwerInfoToClientHandler extends Handler {
	
		public override function action(): void{
			var msg: ResBossOwerInfoToClientMessage = ResBossOwerInfoToClientMessage(this.message);
			//TODO 添加消息处理
		}
	}
}