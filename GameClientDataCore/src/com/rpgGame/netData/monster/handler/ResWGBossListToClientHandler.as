package com.rpgGame.netData.monster.handler{

	import com.rpgGame.netData.monster.message.ResWGBossListToClientMessage;
	import org.game.netCore.net.Handler;

	public class ResWGBossListToClientHandler extends Handler {
	
		public override function action(): void{
			var msg: ResWGBossListToClientMessage = ResWGBossListToClientMessage(this.message);
			//TODO 添加消息处理
		}
	}
}