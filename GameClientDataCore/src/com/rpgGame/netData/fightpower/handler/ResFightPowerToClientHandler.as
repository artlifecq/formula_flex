package com.rpgGame.netData.fightpower.handler{

	import com.rpgGame.netData.fightpower.message.ResFightPowerToClientMessage;
	import org.game.netCore.net.Handler;

	public class ResFightPowerToClientHandler extends Handler {
	
		public override function action(): void{
			var msg: ResFightPowerToClientMessage = ResFightPowerToClientMessage(this.message);
			//TODO 添加消息处理
		}
	}
}