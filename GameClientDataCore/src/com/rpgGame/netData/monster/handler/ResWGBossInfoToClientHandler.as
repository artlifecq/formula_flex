package com.rpgGame.netData.monster.handler{

	import com.rpgGame.netData.monster.message.ResWGBossInfoToClientMessage;
	import org.game.netCore.net.Handler;

	public class ResWGBossInfoToClientHandler extends Handler {
	
		public override function action(): void{
			var msg: ResWGBossInfoToClientMessage = ResWGBossInfoToClientMessage(this.message);
			//TODO 添加消息处理
		}
	}
}