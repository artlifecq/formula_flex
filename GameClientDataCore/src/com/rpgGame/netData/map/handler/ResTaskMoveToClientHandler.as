package com.rpgGame.netData.map.handler{

	import com.rpgGame.netData.map.message.ResTaskMoveToClientMessage;
	import org.game.netCore.net.Handler;

	public class ResTaskMoveToClientHandler extends Handler {
	
		public override function action(): void{
			var msg: ResTaskMoveToClientMessage = ResTaskMoveToClientMessage(this.message);
			//TODO 添加消息处理
		}
	}
}