package com.rpgGame.netData.npc.handler{

	import com.rpgGame.netData.npc.message.ResTaskNpcGatherFinishMessage;
	import org.game.netCore.net.Handler;

	public class ResTaskNpcGatherFinishHandler extends Handler {
	
		public override function action(): void{
			var msg: ResTaskNpcGatherFinishMessage = ResTaskNpcGatherFinishMessage(this.message);
			//TODO 添加消息处理
		}
	}
}