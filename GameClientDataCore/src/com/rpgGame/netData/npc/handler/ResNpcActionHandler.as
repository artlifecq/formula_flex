package com.rpgGame.netData.npc.handler{

	import com.rpgGame.netData.npc.message.ResNpcActionMessage;
	import org.game.netCore.net.Handler;

	public class ResNpcActionHandler extends Handler {
	
		public override function action(): void{
			var msg: ResNpcActionMessage = ResNpcActionMessage(this.message);
			//TODO 添加消息处理
		}
	}
}