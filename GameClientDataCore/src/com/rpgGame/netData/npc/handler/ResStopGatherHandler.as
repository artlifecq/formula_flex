package com.rpgGame.netData.npc.handler{

	import com.rpgGame.netData.npc.message.ResStopGatherMessage;
	import org.game.netCore.net.Handler;

	public class ResStopGatherHandler extends Handler {
	
		public override function action(): void{
			var msg: ResStopGatherMessage = ResStopGatherMessage(this.message);
			//TODO 添加消息处理
		}
	}
}