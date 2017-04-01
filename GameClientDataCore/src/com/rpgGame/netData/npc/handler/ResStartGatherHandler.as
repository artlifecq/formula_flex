package com.rpgGame.netData.npc.handler{

	import com.rpgGame.netData.npc.message.ResStartGatherMessage;
	import org.game.netCore.net.Handler;

	public class ResStartGatherHandler extends Handler {
	
		public override function action(): void{
			var msg: ResStartGatherMessage = ResStartGatherMessage(this.message);
			//TODO 添加消息处理
		}
	}
}