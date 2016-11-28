package com.rpgGame.netData.npc.handler{

	import com.rpgGame.netData.npc.message.ResNpcServicesMessage;
	import org.game.netCore.net.Handler;

	public class ResNpcServicesHandler extends Handler {
	
		public override function action(): void{
			var msg: ResNpcServicesMessage = ResNpcServicesMessage(this.message);
			//TODO 添加消息处理
		}
	}
}